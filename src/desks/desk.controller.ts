import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { DeskService } from './desk.service';
import { CreateDeskDto } from './dto/create-desk.dto';
import { UpdateDeskDto } from './dto/update-desk.dto';
import { ApiCreatedResponse, ApiResponse } from '@nestjs/swagger';

@Controller('desks')
export class DeskController {
  constructor(private readonly desksService: DeskService) {}

  @Post()
  @ApiCreatedResponse({
    status: 201,
    description: 'The record has been successfully created.',
  })
  @ApiResponse({ status: 403, description: 'Forbidden.' })
  create(@Body() createDeskDto: CreateDeskDto) {
    return this.desksService.create(createDeskDto);
  }

  @Get()
  findAll() {
    return this.desksService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.desksService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateDeskDto: UpdateDeskDto) {
    return this.desksService.update(+id, updateDeskDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.desksService.remove(+id);
  }
}
