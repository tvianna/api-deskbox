import {
  IsBoolean,
  IsInt,
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';

export class UpdateDeskDto {
  @IsNotEmpty()
  @IsString()
  title: string;

  @IsNotEmpty()
  @IsString()
  description: string;

  @IsNotEmpty()
  @IsBoolean()
  status: boolean;

  @IsOptional()
  deletedAt?: Date;

  @IsInt()
  @IsOptional()
  deletedBy?: number;
}
