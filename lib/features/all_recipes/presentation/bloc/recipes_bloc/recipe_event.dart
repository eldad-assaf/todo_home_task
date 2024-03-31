abstract class ReciptsEvent {
  const ReciptsEvent();
}

class FetchAllReciptsEvent extends ReciptsEvent {
  const FetchAllReciptsEvent() : super();
}

class ResetToInitialStateEvent extends ReciptsEvent {
  const ResetToInitialStateEvent() : super();
}
