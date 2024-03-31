abstract class SpecificReciptsEvent {
  const SpecificReciptsEvent();
}

class FetchSpecificRecipeEvent extends SpecificReciptsEvent {
  final String recipeId;
  const FetchSpecificRecipeEvent(this.recipeId) : super();
}

class ResetToInitialStateEvent extends SpecificReciptsEvent {
  const ResetToInitialStateEvent() : super();
}
