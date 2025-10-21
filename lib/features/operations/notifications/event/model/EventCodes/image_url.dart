class EventImageHelper {
  static String getEventImage(String? category) {
    final lower = category?.toLowerCase().trim() ?? '';

    switch (lower) {
      case 'party':
        return 'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cGFydHl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500';
      case 'wedding':
        return 'https://images.unsplash.com/photo-1515934751635-c81c6bc9a2d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHdlZGRpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500';
      case 'meeting':
        return 'https://images.unsplash.com/photo-1628062699790-7c45262b82b4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fG1lZXRpbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500';
      case 'ceremony':
        return 'https://images.unsplash.com/photo-1456272875769-b47e860f93a4?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2VyZW1vbnl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500';
      case 'gathering':
        return 'https://images.unsplash.com/photo-1531058020387-3be344556be6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdhdGhlcmluZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&q=60&w=500';
      case 'other':
      default:
        return 'https://images.unsplash.com/photo-1532626645199-7d73d72055ec?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8b3RoZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500';
    }
  }
}
