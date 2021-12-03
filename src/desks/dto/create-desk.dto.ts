import { IsBoolean, IsInt, IsNotEmpty, IsString } from 'class-validator';

export class CreateDeskDto {
  @IsNotEmpty()
  @IsString()
  title: string;

  @IsNotEmpty()
  @IsString()
  description: string;

  @IsNotEmpty()
  @IsBoolean()
  status: boolean;

  @IsNotEmpty()
  @IsInt()
  createdBy: number;

  // @IsNotEmpty()
  // @IsDateString()
  createdAt: Date;
}
