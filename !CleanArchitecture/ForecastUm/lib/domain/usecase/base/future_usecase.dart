abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input params);
}
