abstract class BaseRepository<T> {
  Future<void> add(T item);

  Future<void> delete(T item);

  Future<List<T>> getAll();
  Future<T?> get(int id);

  Future<void> update(T item);
}
