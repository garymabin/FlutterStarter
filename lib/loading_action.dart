class LoadingAction {
  static const LOADING_ACTION_REFRESH = 0;
  static const LOADING_ACTION_MORE = 1;

  final int loadingAction;
  final int startingIndex;
  Function onFinished;

  LoadingAction(this.startingIndex, this.loadingAction, {onFinished}):
        this.onFinished
  = onFinished;

}
