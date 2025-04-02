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