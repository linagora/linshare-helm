{{/* vim: set filetype=mustache: */}}


{{/*
Expand the name of the chart.
*/}}
{{- define "linshare.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "linshare.labels" -}}
helm.sh/chart: {{ include "linshare.chart" . }}
{{ include "linshare.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "linshare.selectorLabels" -}}
app.kubernetes.io/name: {{ include "linshare.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}




{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "linshare.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create the secret name for database linshare account
*/}}
{{- define "linshare.database.secretName" -}}
{{- if .Values.database.secretName -}}
{{- .Values.database.secretName | trimSuffix "-" -}}
{{- else -}}
{{- include "linshare.fullname" . }}-database
{{- end -}}
{{- end -}}

{{/*
Create the secret name for mongodb linshare account
*/}}
{{- define "linshare.mongodb.secretName" -}}
{{- if .Values.mongodb.secretName -}}
{{- .Values.mongodb.secretName | trimSuffix "-" -}}
{{- else -}}
{{- include "linshare.fullname" . }}-mongodb
{{- end -}}
{{- end -}}

{{/*
Create the secret name for root linshare account
*/}}
{{- define "linshare.init.rootSecretName" -}}
{{- if .Values.init.rootSecretName -}}
{{- .Values.init.rootSecretName | trimSuffix "-" -}}
{{- else -}}
{{- include "linshare.fullname" . }}-root-account
{{- end -}}
{{- end -}}

{{/*
Create a random secret
*/}}
{{- define "linshare.random.secret" -}}
{{- printf "%s@" (randAlphaNum 16) | b64enc -}}
{{- end -}}
