class PagingInfo {
  int currentPage = 0;
  int totalPage = 0;
  int itemInPerPage = 10;

  PagingInfo(int numberOfItemInPerPage, int totalItem) {
    if (totalItem > 0) {
      currentPage = 1;
      itemInPerPage = numberOfItemInPerPage;
      totalPage = totalItem ~/ numberOfItemInPerPage +
          ((totalItem % numberOfItemInPerPage) == 0 ? 0 : 1);
    } else {
      currentPage = 0;
      totalPage = 0;
    }
  }
  List<T> getListPage<T>(List<T> list) {
    if (list.isEmpty) {
      return [];
    }
    int start = (currentPage - 1) * itemInPerPage;
    int end = start + itemInPerPage;
    if (end > list.length) {
      end = list.length;
    }
    return list.sublist(start, end);
  }

  void setTotalPage(int totalItem) {
    if (totalItem > 0) {
      totalPage = totalItem ~/ itemInPerPage +
          ((totalItem % itemInPerPage) == 0 ? 0 : 1);
    } else {
      currentPage = 0;
      totalPage = 0;
    }
  }
}
