{{/*
Expand the name of the chart.
*/}}
{{- define "draft-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "draft-backend.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "draft-backend.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "draft-backend.labels" -}}
helm.sh/chart: {{ include "draft-backend.chart" . }}
{{ include "draft-backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "draft-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "draft-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels for app
*/}}
{{- define "draft-backend.appSelectorLabels" -}}
app.kubernetes.io/name: {{ include "draft-backend.name" . }}-app
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Container Name for app
*/}}
{{- define "draft-backend.appContainerName" -}}
app
{{- end }}

{{/*
Selector labels for cache
*/}}
{{- define "draft-backend.cacheSelectorLabels" -}}
app.kubernetes.io/name: {{ include "draft-backend.name" . }}-cache
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Container Name for cache
*/}}
{{- define "draft-backend.cacheContainerName" -}}
cache
{{- end }}

{{/*
Selector labels for db
*/}}
{{- define "draft-backend.dbSelectorLabels" -}}
app.kubernetes.io/name: {{ include "draft-backend.name" . }}-db
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Container Name for db
*/}}
{{- define "draft-backend.dbContainerName" -}}
db
{{- end }}

{{/*
Selector labels for gateway
*/}}
{{- define "draft-backend.gatewaySelectorLabels" -}}
app.kubernetes.io/name: {{ include "draft-backend.name" . }}-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Container Name for gateway
*/}}
{{- define "draft-backend.gatewayContainerName" -}}
gateway
{{- end }}
