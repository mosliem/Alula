//
//  NetworkService.swift
//  Alula
//
//  Created by mohamed sliem on 27/03/2024.
//

import Utilits
import Foundation

class NetworkService {

    static let shared = NetworkService()

    var url: URL?
    var request: URLRequest?
    private init() {}

    func request<ModelType: Codable> (
        endpoint: Requsetable,
        model: ModelType.Type,
        body: [String: String]? = nil
    ) async throws -> ModelType {

        do {
            url = try buildUrl(
                scheme: endpoint.schema,
                host: endpoint.host,
                path: endpoint.path,
                queryItems: endpoint.queryParameters,
                port: endpoint.port
            )

            request = try buildRequest(
                url: url ?? URL(string: "")!,
                httpMethod: endpoint.httpMethod,
                httpBody: body,
                headers: endpoint.headers
            )

        } catch {
            throw error
        }

        return try await executeRequest(request: request!, model: model)
    }

    func buildUrl(
        scheme: String,
        host: String,
        path: String,
        queryItems: [String: Any]? = nil,
        port: Int? = nil
    ) throws -> URL {

        let fullHost = scheme + "://" + host
        let hostUrl = URL(string: fullHost)

        guard let fullUrl = URL(string: path, relativeTo: hostUrl) else {
            throw NetworkError.urlError
        }

        var urlComp = URLComponents(url: fullUrl, resolvingAgainstBaseURL: true)

        if let port {
            urlComp?.port = port
        }

        // MARK: - query
        if let queryItems {
            var parameters = [URLQueryItem]()
            for query in queryItems {

                parameters.append(
                    URLQueryItem(
                        name: query.key,
                        value: String(describing: query.value)
                    )
                )
            }
            urlComp?.queryItems = parameters
        }

        guard let url = urlComp?.url else {
            throw NetworkError.urlError
        }

        return url
    }

    // MARK: - request

    func buildRequest(
        url: URL,
        httpMethod: HTTPMethod,
        httpBody: [String: String]?,
        headers: [String: String]?
    ) throws -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers

        guard let httpBody else {
            return request
        }

        do {
            request.httpBody = try JSONEncoder().encode(httpBody)
        } catch {
            throw NetworkError.encodingFailed
        }

        return request
    }

    // MARK: - execution
    func executeRequest<ModelType: Codable>(
        request: URLRequest,
        model: ModelType.Type
    ) async throws -> ModelType {

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.requestFailed
        }

        guard response.statusCode < 300 else {
            throw NetworkError.custom(statusCode: response.statusCode)
        }

        do {
            return try JSONDecoder().decode(model.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

}
