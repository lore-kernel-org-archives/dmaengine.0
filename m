Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E94BB5C7
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599172; cv=none; b=ozswQATeYa0Ecs4Yh03V8+d9AVn2AIlFEAPC+MjG+dnJXn6uSnPqKNDrVZ9Tt0V26QeiLWyfmsX5rPoH6Bu6YIXGGoI1alif/Tbv7MD+vZJdMtd/EC7uSHMVuhSmY5Az3WNMtVJVm4OTGJuQ8RvYPk5a4yCP5KzUGRcvWbm55Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599172; c=relaxed/simple;
	bh=arXrzXw1ZVNnEqRDCo54MSPhISa4DKc9+YJ0ppSUDZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoeTXpLVtPKyPY8Eu+Bd9OWDR0LjWv2quYkz78X6zJXnkrCkkI7dSaYHffu8pMqJZ+YvuSOPuutw7lf2U7b80yBWKUkcFmjLgd6edH8xLAWdqLWC+/vJD4dCxoV2F55dvNCw2fPz2XqALc/OJ34mMBiAtrFf+eRgQKyFgKeKXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0HXXFIz; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0HXXFIz"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so224575b3a.1
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789599163; x=1790203963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcCVCZZIuCZjQ/QMXzHP9HwhT/qabKv1gdd0PxfrlCk=;
        b=B0HXXFIzHoRQfsOkjagOgQnzOD5eKJauqqcAoanm3c0TT/BHTAnMfmljIIinMzKggy
         WiAEZoMBhDTkJPoqWcsCz5Ua6al6hF+thvQyqyzXvU7YxcYoqMqW4CrShywunBp7IcwD
         jU6sA6qNeZZE7ZD9XCq4NLpKEUWlFX72G2Y4xz6MsMuLMFLuZjbgu0MFUAhdgolYpbe8
         r6wGqCSRiNSx39mLT6FKD/OnU0Fby4j+StghVBzsfenqHB3AhceKU8oBjDYgQEU6XM/6
         jX55+gAKgxQzmr2U6mods7zybSV4oh0x+HqhvdsHQdPMy5NVqvD4KdiX10Rle7A3xtEa
         BdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599163; x=1790203963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcCVCZZIuCZjQ/QMXzHP9HwhT/qabKv1gdd0PxfrlCk=;
        b=YnfVmpuwnH0okZQ8kqV2LguNunWTX7Q9j0USJ4tgNxB20qTYTEfWhstFBYCYiss0Yc
         FTdNIokViPCrc97GvruL3qq3MEliYcGbXmVLkdL2X7qiujc2BLWxSsZpGV47PZ/iYqcn
         Wo7vGU8Lin7Tvr4W7eRFn3ytxdQ2MvXBeLwNFjOGpWaMckBprTKceJGW189juGnxTVOO
         xsYLUTTkUWIK4yVXesFRokbDtVEqzPZFo71kuwDs03BiaS1qr5kVlz1JpONsd/zGBJu9
         iURmpCwCEeB1Ekpb70P7exi87TRSmODpfzGphgKRVNN6hxBYKJvFyzS/ondFfiJd5AAY
         AcQQ==
X-Gm-Message-State: AFuF++nQceqVkld/nwuvTMHvy7Pmclgs8lGllImYYJ3wPb77zTMoQdDs
	RLF1YDYFCSYh5haVcrvC020ZywMbmRGmb36x8M77DkAAOqqpMLiSvv1U09SVbg==
X-Gm-Gg: AYBFou03GSDv22NBINfpoI7ZpSK0mIQhjmFlIYyuN0ySk1zN92yEjZ6OcZFZJYn99ov
	3Y8Hkih6qvzrXVGQFo9JJ1pFqbgPW3K9JhaAXZWNmOjETaaxvQPknhtytxuy8Bnb9TN3U5x6Lhu
	JeE1pilnZnpbDso/YYuSSimVlnv2zOSToAtJp+CJ8qM5slU9v0/i4e5cc/XltuJusane7NI/Vg6
	4Bmlbo8ytOTm12dVsRQhhJ0Jx4yagLVNOtD5HKB3YtRmrZ0jEja/3BXeOPbUcvvLi81pHxgBaBm
	YPcS1WURS21oTsSBOJ44LVvSuZyNfS0ztHhV158cidy2aCk5VXzYAQLDwuZSkdOxcQ+QtyTulXL
	HY3Z/kcD7rjWGrYp+91gWgJVvBI+1eQjeLkOpkZp3O+ZrGLZy2SZ5Dmpmfyv5Wq/aKVnZdWpl1E
	Ij1jgPatLPBJg0DCd6qFawsnWLwSbbrxrI+NuNh9g9Y9OYX3qD6qNkwYacZUWs4XBiUV2379sGy
	AUzIwlGPCs1EdAW9FUXChczT8Bu66M0+v5nVPFqZJ68jGoBuSQtDoMB5iVAt2vB5AhAJJTasjSg
	3qOfO32onOVVhjnsVrMdm30A1Ts/7hkVlZlppfJfP+ZRCyKt
X-Received: by 2002:a05:6a00:4613:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-8723b87e91bmr8819108b3a.25.1789599163494;
        Wed, 16 Sep 2026 15:52:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febdd299sm1899056b3a.2.2026.09.16.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:52:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ste_dma40: allow COMPILE_TEST
Date: Wed, 16 Sep 2026 15:52:41 -0700
Message-ID: <20260916225241.280606-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses portable kernel APIs and AMBA bit-field macros from
<linux/amba/bus.h>. Allow building on other architectures via
COMPILE_TEST for wider compile coverage.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..f16bd4059d84 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -559,7 +559,7 @@ config SOPHGO_CV1800B_DMAMUX
 
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
-	depends on ARCH_U8500
+	depends on ARCH_U8500 || COMPILE_TEST
 	select DMA_ENGINE
 	select SRAM
 	help
-- 
2.55.0

