import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'resume'
})
export class ResumePipe implements PipeTransform {

  transform(value: any, args: any): string{
    if(!value){
      return null;
    }
    return value.substr(0,30) + '...' ;
  }
}
