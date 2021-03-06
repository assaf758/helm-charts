{{/* vim: set filetype=mustache: */}}

{{/*
Create fully qualified names.
*/}}
{{- define "v3iod.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "v3iod.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "v3iod.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "v3iod.client.name" -}}
{{- printf "%s-v3iod-client" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "v3iod.cache.name" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-locator" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "v3iod.cache.fullname" -}}
{{- printf "%s-locator" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
