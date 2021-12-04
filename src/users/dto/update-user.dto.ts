import { ApiProperty } from '@nestjs/swagger';
export class UpdateUserDto {
  @ApiProperty()
  email?: string;

  @ApiProperty()
  password?: string;

  @ApiProperty()
  name?: string;

  @ApiProperty()
  status?: number;

  deletedAt?: Date;
  deletedBy?: number;
}
