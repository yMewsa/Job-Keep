import { readFile, writeFile } from 'node:fs/promises';
import { spawnSync } from 'node:child_process';
import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const rootDirectory = resolve(fileURLToPath(new URL('..', import.meta.url)));
const openApiPath = 'docs/openapi.json';
const outputDirectory = 'apps/mobile/packages/api_client';
const generatorEntrypoint = resolve(
  rootDirectory,
  'node_modules/@openapitools/openapi-generator-cli/main.js',
);
const args = [
  'generate',
  '-i',
  openApiPath,
  '-g',
  'dart-dio',
  '-o',
  outputDirectory,
  '--global-property',
  'apiTests=false,modelTests=false,apiDocs=false,modelDocs=false',
  '--additional-properties',
  'pubName=job_keep_api_client,serializationLibrary=json_serializable',
];

const result = spawnSync(process.execPath, [generatorEntrypoint, ...args], {
  cwd: rootDirectory,
  stdio: 'inherit',
});

if (result.error) {
  console.error('Não foi possível iniciar o OpenAPI Generator CLI.', result.error);
  process.exitCode = 1;
} else if (result.status !== 0) {
  process.exitCode = result.status ?? 1;
} else {
  const pubspecPath = resolve(rootDirectory, outputDirectory, 'pubspec.yaml');
  const pubspec = await readFile(pubspecPath, 'utf8');
  const updatedPubspec = pubspec.replace("sdk: '>=3.5.0 <4.0.0'", "sdk: '>=3.8.0 <4.0.0'");
  if (updatedPubspec === pubspec) {
    throw new Error('Não foi possível definir a versão mínima compatível do Dart no pubspec.');
  }
  await writeFile(pubspecPath, updatedPubspec, 'utf8');

  const analysisOptionsPath = resolve(rootDirectory, outputDirectory, 'analysis_options.yaml');
  const analysisOptions = await readFile(analysisOptionsPath, 'utf8');
  const updatedAnalysisOptions = analysisOptions.replace(
    'deprecated_member_use_from_same_package: ignore',
    'deprecated_member_use_from_same_package: ignore\n    unused_import: ignore',
  );
  if (updatedAnalysisOptions === analysisOptions) {
    throw new Error('Não foi possível configurar o analisador para o código Dart gerado.');
  }
  await writeFile(analysisOptionsPath, updatedAnalysisOptions, 'utf8');
}
