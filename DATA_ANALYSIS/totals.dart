import 'dart:io';

void main(List<String> arguments){
  if(arguments.isEmpty){
    print("Usage: dart totals.dart <inputFile.csv>");
    exit(1);
  }
  final inputFile = arguments.first;
  final lines = File(inputFile).readAsLinesSync();
  final totalDurationByTag = <String, double>{}; // 1. This is an empty map
  lines.removeAt(0); // 2. Removing first line which is the header
  var totalDuration = 0.0;
  for (var line in lines){
    final values = line.split(','); // 3. Splitting lines using commas
    final durationStr = values[3].replaceAll('"', '');// 4. Remove double quotes of stringed digits
    final duration = double.parse(durationStr); // convert string to integers(double)
    final tag = values[5].replaceAll('"', ''); // 6.
    final previousTotal = totalDurationByTag[tag];
    if(previousTotal == null){
      totalDurationByTag[tag] = duration;
    } else{
      totalDurationByTag[tag] = previousTotal + duration;
    }
    totalDuration += duration;
  }
  for(var entry in totalDurationByTag.entries){
    final durationFormatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated': entry.key;
    print('$tag: ${durationFormatted}h');
  }
  print('Total for all tags: ${totalDuration.toStringAsFixed(1)}h');
} 

