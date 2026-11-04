enum UserRole {
  landlord,
  admin,
  resident,
  security,
  unknown
}

UserRole getUserRoleFromString(String role) {
  switch (role.toLowerCase()) {
    case 'landlord':
      return UserRole.landlord;
    case 'admin':
      return UserRole.admin;
    case 'resident':
      return UserRole.resident;
    case 'security':
      return UserRole.security;
    default:
      return UserRole.unknown;
  }
}