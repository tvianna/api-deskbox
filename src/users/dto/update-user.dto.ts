export class UpdateUserDto {
  email?: string;
  password?: string;
  name?: string;
  status?: number;
  createdBy?: number;
  deletedAt?: Date;
  deletedBy?: number;
}
