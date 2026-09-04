Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262524A8A0A
	for <dmaengine@vger.kernel.org>; Fri,  4 Sep 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531054; cv=none; b=CCqlwTl/40PODHBDjBmb1PFEWGM6OHoiIqJsJDijGX+56nEMPU3KJOaDfmoalbnwVhRHBoEGD7eU2SpJ919Am3P7lclsESMaaoq7AJ7A146ZpYwvulVxS8yXi639A4RMAX1Z/hmg0VjILdwbYOYn9qE+6Nem91vFbp/jFJOh9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531054; c=relaxed/simple;
	bh=6+l3T16YqBoRlbABnst1+TqgdnjDEqIeHNaVG4pj+9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOhxZugNDjqMKpKhnCyc4HRu/Qj1YdR1A1Eo0gKbJtBzQHZv/IKYZsEryYxR9PsdHaWlCfm9Zvh6bIcG01ABi0nJ8DO6b5MsSIFX6lDV2oiUg9L+1gVQ88G1In19dM9pBHSCvvRgsV3koRmeEiOjTkSNBLAldgUg7v2eqEa2nQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=rFDVVypq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="rFDVVypq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso7927865e9.2
        for <dmaengine@vger.kernel.org>; Fri, 04 Sep 2026 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531051; x=1789135851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=rFDVVypqhaTwhAOZ/TGVCReyQJtT33FK+70F87HhPFPv40fynhVPNa6q/5cnHDYZJM
         gDOt0l/GihgPxw6CBLWfq/p7DzeAVnDS6gRf5qTl+EgJVve/gqGFbl1DsUk4ztz+ms6T
         6oLKlcbQbExhSHwRTsGqBQ+AOFw9enpz51jcge/znA1QZiyQMdekykwYVgp6Fm3XXBz+
         +czxSLQwwBX03Rthh0FR71yE4dh7nHBP9Pk+SWCTc/ntbxUs4o2OoUKj3aFnk6RoGkR5
         CTTQQt+AD8bYg3dPuPYGuulaMJXugLC1TlhjE8ZWdUX1v3ewdSh77Fla8DdIx4ORhRz5
         qOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531051; x=1789135851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOMrL5pgvFhwSvByI+4qlT7MXoUJL5NjWpFqsiJ9Hnw=;
        b=BL4+USw2w7yZdd/Im5bP6wOuaoz9Bp1kqwtlFbILYTEfb5pFTxI69fKyW1rRHm2trb
         nGqzm+9HDaB1Gfw2ccaFgPrzNkmosXe9fQfCudlIQybArK6Y1TU1Ny0+QBTSUYffbnm7
         TUiyA8IAbEiIABANgNorjAoXcW/I5xhG++33ot3nYNQ7yBzGLieOtYSUyTEjmfujtEdK
         /moTp3HU6ZC+9r5F94AnH1KEDDFtKB96JZWi3WkN55LrkTFcxo0LZyM7Ou5qlWQ36GfI
         F45+LmtG8p7iizre150YdX244n3Ylzg/c2DyQONBJu9umgUJf/3YK0Z54lOZO7jhRjDs
         k95w==
X-Gm-Message-State: AFuF++lo2UvH9ZKdC1w0k89WVmTw5yfyY6TrMNop4PIv6AA6Mhnuh+b7
	XGaymf1jGZJLrtNLu4AZr1wgWvb5pnZhXFSfN8MD/AyTzY1FJLHP79aeuQrIexdkbRI=
X-Gm-Gg: AYBFou2w3qLfz8+T/3J3RxH0x0jAnBiI4x4O8awT9C1RgYmSiV+qY60tqqjByFmL9KA
	go9c50mjVKJiinqfiUgnmlnKipuT1ld8207X0rDYWYp/ShWdh68SdiD2xmr0RpfupIjtzgYDd/E
	0bsS2c5Izstvi/QzO9YxwkaDpHUMte69OXbO2glfZzh9abRa/KYIPmhxOGqlSoCzGlh3f9uuw0g
	myqdL+zwUZieTEoCvgUr6A+2+YVKV8w/M9/J3WmFoRuvhItg6MYESO8E8SP15p8DB1VvfnfdUUc
	i/kGra8WiC8lVp5NvWF4YYT0DUWVc5ECj5LrWywlHMn/bu08409aIcP1TzNqEJrtY8iz0dQGRw7
	fHijixujWNmZj7MtTp51s6aQwheBUUe1r1H1vicoFlbpTXh86qrFDkuqg37qzWe3PwnOaGB1S1S
	vGyBMTon9OaUrR73JNZ9BvhSneC5Qt0coIqLHNzQvTC/46Sz+2P+Oy5sBC979GnYPw33mbtKkC8
	erxrA==
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr48051785e9.24.1788531051262;
        Fri, 04 Sep 2026 07:10:51 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:50 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:43 +0100
Subject: [PATCH 4/4] dma: xgene-dmac: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-4-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1006;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=6+l3T16YqBoRlbABnst1+TqgdnjDEqIeHNaVG4pj+9I=;
 b=1/UGTl9qld09cFRhCKZNZevEkztnHBWqKduXD1tX9YhzELe4Wk3gFziz0npmX7vUgzAuy4qFd
 fw3G4nKijjXCWmhBWW9yq9WNMTDI/f+Md4KBbsec71lteOOf2SQDUnU
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields
which makes the code more readable and consistent with how
lists are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

