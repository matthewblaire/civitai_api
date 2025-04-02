/// Response for the image upload endpoint.
class ImageUploadResponse {
  /// The ID of the uploaded image.
  final int id;

  /// The upload URL for the image.
  final String uploadURL;

  /// Creates a new image upload response.
  const ImageUploadResponse({
    required this.id,
    required this.uploadURL,
  });

  /// Creates an image upload response from a JSON map.
  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    return ImageUploadResponse(
      id: json['id'] as int,
      uploadURL: json['uploadURL'] as String,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uploadURL': uploadURL,
    };
  }
}

/// Response for the multipart upload creation endpoint.
class MultipartUploadResponse {
  /// The upload ID for the multipart upload.
  final String uploadId;

  /// The key for the uploaded file.
  final String key;

  /// The S3 upload URL.
  final String uploadURL;

  /// The parts to upload.
  final List<MultipartUploadPart> parts;

  /// Creates a new multipart upload response.
  const MultipartUploadResponse({
    required this.uploadId,
    required this.key,
    required this.uploadURL,
    required this.parts,
  });

  /// Creates a multipart upload response from a JSON map.
  factory MultipartUploadResponse.fromJson(Map<String, dynamic> json) {
    return MultipartUploadResponse(
      uploadId: json['uploadId'] as String,
      key: json['key'] as String,
      uploadURL: json['uploadURL'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => MultipartUploadPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'uploadId': uploadId,
      'key': key,
      'uploadURL': uploadURL,
      'parts': parts.map((part) => part.toJson()).toList(),
    };
  }
}

/// Represents a part in a multipart upload.
class MultipartUploadPart {
  /// The upload URL for this part.
  final String url;

  /// The part number.
  final int partNumber;

  /// The part size in bytes.
  final int size;

  /// Creates a new multipart upload part.
  const MultipartUploadPart({
    required this.url,
    required this.partNumber,
    required this.size,
  });

  /// Creates a multipart upload part from a JSON map.
  factory MultipartUploadPart.fromJson(Map<String, dynamic> json) {
    return MultipartUploadPart(
      url: json['url'] as String,
      partNumber: json['partNumber'] as int,
      size: json['size'] as int,
    );
  }

  /// Converts this multipart upload part to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'partNumber': partNumber,
      'size': size,
    };
  }
}
