class ApiResponse<T> {
  int? statusCode;
  bool loading;
  bool error;
  bool success;
  String message = "";
  T? body;
  MetaData? metaData;

  ApiResponse({this.statusCode, this.loading = false, this.error = false, this.success = false});

  ApiResponse.loading({this.loading = true, this.success = false, this.error = false});

  ApiResponse.errorWithRetry(
      {this.success = false, this.loading = false, this.error = true, this.message = "Error please try again"});

  ApiResponse.success(
      {this.body,
      this.success = true,
      this.loading = false,
      this.error = false,
      this.message = "Success",
      this.metaData});
}

class MetaData {
  final int? page;
  final int? limit;
  bool hasNext;
  final int? pages;
  final int? total;
  final String? data;
  MetaData({this.total, this.limit, this.data, this.page, this.pages, this.hasNext = false});
}
