import '../entities/enums.dart';

/// Parameters for creating a multipart upload.
class CreateMultipartUploadParams {
  /// The MIME type of the file.
  final String? mimeType;

  /// The name of the file.
  final String? filename;

  /// The size of the file in bytes.
  final int size;

  /// Creates parameters for a multipart upload.
  const CreateMultipartUploadParams({
    this.mimeType,
    this.filename,
    required this.size,
  });

  /// Converts these parameters to a JSON map for the request body.
  Map<String, dynamic> toJson() {
    return {
      if (mimeType != null) 'mimeType': mimeType,
      if (filename != null) 'filename': filename,
      'size': size,
    };
  }
}

/// Parameters for completing a multipart upload.
class CompleteMultipartUploadParams {
  /// The upload ID.
  final String uploadId;

  /// The list of etags from uploaded parts.
  final List<String> parts;

  /// Creates parameters for completing a multipart upload.
  const CompleteMultipartUploadParams({
    required this.uploadId,
    required this.parts,
  });

  /// Converts these parameters to a JSON map for the request body.
  Map<String, dynamic> toJson() {
    return {
      'uploadId': uploadId,
      'parts': parts,
    };
  }
}

/// Parameters for aborting a multipart upload.
class AbortMultipartUploadParams {
  /// The upload ID.
  final String uploadId;

  /// Creates parameters for aborting a multipart upload.
  const AbortMultipartUploadParams({
    required this.uploadId,
  });

  /// Converts these parameters to a JSON map for the request body.
  Map<String, dynamic> toJson() {
    return {
      'uploadId': uploadId,
    };
  }
}
