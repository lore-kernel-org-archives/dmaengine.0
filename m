Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E2C3CFF56
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717658; cv=none; b=I1rHjMgZ5U0zq+29CiLi7fGpEO0JGxq/s5/aKKxkiCHnTwDO9SReR0ucfrTFbjQQF8D9DOMc/wNnpZrTAEJHw76sUhXtQiZWoE+Pi+IBGEbUkKyz+kIYARgLCZ2pTxzovCJY1KEhUpRfcn1GWnIw0rqoK8J/vIKD5GX+Vior0s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717658; c=relaxed/simple;
	bh=0puQPuQWWulYAhnu3BLCOE1T6GpuWApgnYBpUlFGRLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UP3izkqG9qZhz9Mgg8+RIHUbsyg+gKlh25c9IA7kkG55B4gQmdxP4Jrq4IprbbXVEXhMDicPvmAhPqHDAN4Pc8bn3A6Z67Vm/LEuTwmFXs89gw1OcskUJ2zFo3kK/xRitVpGGc4yozPn8SODaGeZ5sd8FhElH9PuHGY09xzy0uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=RBx5QBMI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="RBx5QBMI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20e4487bdaso10641166b.2
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786717647; x=1787322447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=RBx5QBMIGyqlivk6ew3ftH8ubZOmP7pyTMQpsG6Zykk2x0MY56Zi+PkRMtUMvpvbia
         fSPkyipbbDeInEZoFM3AP5emUi3ye0J/zADGcGYTePZXSRojRXTvpLqqCeTrjNrRN95q
         HaGYy4sRxWUSNedDEwbt+NPztMUQVWuynPs3q+1aaPIm73cjWmM16UgXg4udSgvMBfc8
         FVSPBV2Z+hW+ZrO/YRckR7Hxl3hy0R+IwFwQyiMeXJ1ZD0hpiGCRZMv725qYhvuugwLG
         /X6wfc5dxuCMlMWSHUD5s4XE63k1XnFV05PU5XUt662XNAYtSz3cxYyjJW1SobZmU9to
         EAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786717647; x=1787322447;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiRDm4IQnhuQ7LPoTTfQGjc9v5HsytEDBpwNIg9MWYw=;
        b=AWSGG1yCU5bCxTkA5q/jW1W5Ii93ZMxjjMaM2JGmKrwYqTm7yCteq8275WYx4HUs9r
         ibGHALY4s5uqeiahz7onayP2RblUe4/y2c+L36R9y4cyzVZf0ztGVfM4nzfKlRwKmOu+
         oztOxyJzYdHmYH5hVQIfLWVAto35Hs8ASKMY3TXuJdtMNpR2Yf2cPFf1b67BwsvJ5xWR
         gDtsJRqcj5g1w5L5tv4Yerxhjw8c1nhFGDh99fMhwxySCeK/aqyLZ1FB74OngJB5wHOa
         2PqE4IvslObqGc0p9tdcyi9/oiv6tRMH2FcDGz4/kmJ1C4WJ0+Yx3hR8jSwTv5GUgpXL
         RfCw==
X-Forwarded-Encrypted: i=1; AHgh+RoIPbuIQokTErboY+g6BZnoYOQ35326/O8EPMNx0KPFDxD0e6Oc6MzhGHxSNr5KsaLrKonmLLcMs2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7LRtwIixVpAFYIwn1uk6rUy3XIHz5F6vqqIsLCVGDTxFNAGTM
	bhHTlOaw+sDJJyK7rkpYlKTK6Dj/yWi8W7tYiR1/huH3qTCktizOYuOQFvMEIR8nLVE=
X-Gm-Gg: AR+sD139jbtR0T5T9xjWDu3QyXfyXdKm6JQp725l7QfMKW0oQW24xkfTPtBiKjRpc6a
	UX4Y3BOY2WLF/6k67Y/6jADsIClymN6Jy2q/Y9LBMMmllza6CcpM5ROS/aM6g4nKDilJP/7RdC1
	HWkpPFv/z2qQeswXGwkFLyCUntXeszRi7+4ZnTGBL7OjMJRkmH7XZOsYDXo0tYIBpjWIfmTfjYA
	dnn6CUAZ9dEaW7LtxJo4OIcFxTnoYIEbKc+gsRXI9hrDBJ40Cc1ke7L+m8Ja2ZS9j6umWFqAoi4
	FgWc8Cau2WkiFQZbijkUODDbQcAHkR4f3jpuOMdx0D8rEiPemYuCzexGXKUFrvIGNrcH5SwqwTD
	tYeBEHzolfqOiUNfCwiX3FfVnuA6pZ8XLK0z95JxRQU/RjAWrb0Clco138o0y4xW9APp0r0Y5e/
	TNSr16NIolNObZS6FmyWIrYEgMZATL0R/E/mYtqXMRvbqV+EzPDosgU2br9vNWZWMGXucTeNAES
	y/tipvEJqHwjh7UFHKmB07scFZIKVUvY5OwhlUVcM+b7QfUT+6T9uKkTw==
X-Received: by 2002:a17:906:4fd0:b0:c12:927d:a288 with SMTP id a640c23a62f3a-c2129b1cc3bmr136866666b.1.1786717646762;
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c45ffsm106308866b.19.2026.08.14.07.27.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 07:27:26 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH v2 0/2] Fix two bugs in the DMA status path 
Date: Fri, 14 Aug 2026 16:21:09 +0200
Message-ID: <20260814142708.79120-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for the review. Patch 2 has been updated with a corrected
commit message — the original overclaimed an oops; the fix removes
undefined behaviour but no memory access actually occurs at that point.
Changes in v2:
  - Patch 2: correct commit message to accurately describe the undefined
    behaviour rather than claiming an imminent null pointer dereference

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)

