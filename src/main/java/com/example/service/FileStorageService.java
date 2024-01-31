package com.example.service;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;

@Service
public class FileStorageService {

    @Value("${spring.cloud.gcp.storage.bucket-name}")
    private String bucketName;

    private final Storage storage;

    public FileStorageService(Storage storage) {
        this.storage = storage;
    }

    public String uploadFile(MultipartFile file) throws IOException {
        // GCS에 파일 업로드
        String objectName = generateObjectName(file.getOriginalFilename());
        BlobId blobId = BlobId.of(bucketName, objectName);
        BlobInfo blobInfo = BlobInfo.newBuilder(blobId)
                .setContentType(file.getContentType())
                .build();

        try (InputStream inputStream = file.getInputStream()) {
            Blob blob = storage.create(blobInfo, inputStream.readAllBytes());
        }

        // 업로드된 파일의 GCS URL 반환
        return storage.get(blobId).getMediaLink();
    }

    private String generateObjectName(String originalFilename) {
        // 현재 시간을 기반으로 파일명 생성
        long currentTimeMillis = System.currentTimeMillis();
        String extension = getFileExtension(originalFilename);
    
        // 파일명에 밀리초를 추가하여 고유성 증가
        return "your-folder/" + currentTimeMillis + "." + extension;
    }

    private String getFileExtension(String originalFilename) {
        int dotIndex = originalFilename.lastIndexOf('.');
        return (dotIndex == -1) ? "" : originalFilename.substring(dotIndex + 1);
    }
}