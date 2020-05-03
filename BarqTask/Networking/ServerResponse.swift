enum ServerResponse<T> {
    case success(T), failure(Error?)
}
