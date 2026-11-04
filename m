Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807222;
	b=1VuEqExNNhMAXkcMINXmHa3TZfK5OopzHdxA3JscPg47gg+7mbA77xtlmKtiKmZJbCrc
	 wsOM7ifcxa5sPwq1+aZe78crb1fKgdRO+piRwtuWjELweGzvfu67kMr4/TmYdf49byLis
	 75jH81pmmOgO8bj0EQos8d8uf7FpzlfawXTZLGaQGJnKG+ks4YuYoTN9QsSHXI/QVcBg7
	 tCL/PKCZRENJLsnXtAS7jIOu4xRiJ03NVsue9IxxNEl9SS4NopbcUvZN/2Hh4qH9Ertjm
	 I5ZX+4Vns7jy4jsIOX5YCAv0wiUl6hxt8bfseeCw4klzoxVLoRU9kezhptzNpvxOFlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
	b=HXjLm7UDSSodSi/4NphVOj5FEPZhKvhA1lEGvBnQWpKrsDhMwVoHZcV6xrnT6xnmaIJO
	 nLUr9aDum4CXSftoWKAvcBC1C5t8TvI6AwzYsMwXzJq4KxHcTV3wJq2uDLuMgXdVfYQf6
	 aOoP4kT6LikqABAMOUFADOFkeeEG2ynInCslO9unDzvhF+y91c3GS8jkDJ6bxy8a5nE2+
	 /qGKYYfhmnkKsQ6IAQyhva2BEJ+pUesuhJQbjiyTGHUOUnoCjNeBHmRdLgZz9KW+HlX4j
	 D1qWP+C614BsXC99XSJy0FrJqLEmgB6FCiiRcFhaNhKytEvfxYr9NnkyKhd4/+9i0Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwCSiAHe;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A59606D81C
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 15:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A59606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwCSiAHe
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-886e61fa30fso437668b3a.1
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807220; x=1794412020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
        b=LwCSiAHeyM+W78Fz+17XE30MXkcm64I5GNo+cbCztRz/GcdsQX8EG4XFWzyWJV8MdR
         caip6JTvYWPmxLtEzXYwskhIEG4Zb5Z+ZPCQ1XKuY8+nRvCswgKxzRvBUiHpe2VVGulE
         H2LfuG/O8Bjq8cvOfuzcmqG1QnQKjjXD03DG8sfooDfAfvgZExpp9iVR6KsPwWoA9HuB
         ZFc/vC8+AD3e7LKTVe8xFgobeMRak1ciP+Omgc4F4KAKQSQQuPvya6NM/AgKZmXX8I00
         QCZXpSUYWifuf6q55VUDvshVkbtJm1SHl8qX3dYRzRZ3OJBZgk+DpmIGZ8KEtbCTIHFV
         Z/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807220; x=1794412020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNNaGmO3TjxJeE3rr/zcwrts5NAGa4JXX7iwP1R00A8=;
        b=PJMCQSgPD5UtswLbORkI1sr31G26o2XwDRKrOpyLt7py0r2b6An/1L+OBRUuSkxg1i
         FyCFw4pC8FwGBn2VmBypyCQxfVhHHaq4Xg2VymufWPO9RQJy5cb8FqW/Vb3Z2eaQbA6U
         EsoVpRG73K9lkb9tlTVxghY0XpaL6+DXb/wEEW3YT9sU15nL9OpuxiQhWCRoYszfeU/l
         TrMOr030FEsZfo34Xt0dEKFsb5xVqgm6zF9gxoxRjAUJF4qdHaEsaYfXyjnljDgA60vC
         f8oG2vewMHuV9u3uURTNiNx0z+UgZiBoGFBcU5B82/pbhcdJAlJvFvj3G0RmhZXk66zd
         Du5A==
X-Gm-Message-State: APuU4Z9NY49SRaU+kGDtXQ9xrTC0Iy2cNVDTNabWTulAydPVWtB2rl+p
	fyp0m1VJarwC4JYxtn5hUTeS3wzZB47AIQaVi3aAc0jvDelccPNMKKQvs4AASw==
X-Gm-Gg: AYBFou2Xz5jAq5m55c4q/gd+vLhKSCsGIobTN6j9OW4CnZieGBDa3MfvUSTpNr0LF0M
	EHUtSrTaVBHj0Weajy2EsjHcJ8uiePrBoXG1EyNDInnx6z3bUh2k9WFAy/qjnQHzVGnI86ntQsk
	4FciyevAXs9vsvPtSQSxpppcp5pA2vx8RLzVCCVS0I6DRyW17oGBJDt1SqDqZyIGRp9ApldwsR1
	cxNu31p9C2QcKq4vB8gOJ4cRHAHTgjAYjCGtlfGqGgVNfghJ5vtfwLEnXo89Shj9Z4FMvpuTObG
	Z7SXqJJA5zvH1Q5j2TgWAL/UnOJpv3hEyL6A0F7E2XLMJnm270T5Ar+Q7qVbIv2NRSOL3uJxVPs
	aw/HJytfwjHUqE6ydjsuDwQSIjWb2GSDo0GLP7nJO72scVL69dX5kROBIyhMIKvXFaurDIi/RN2
	gvMIM0QuMdDqv5XKc6x0bk0IO86lOMZvkrMqO8rMIZPxCHErD7MruMhuxWgeOnHpZJgOCj0DC3P
	pTATrnka0ji3NfQ5tlK3IJIp/In+B9eWYioaZlutlz0gfDNCs6YHBq2lpWBzbd4RgkkJBKR6IjW
	dc0KneThRJn/aJYIe7SSBlIx3cToNyJdYbXzrFLK7rvK/mCtOU8h
X-Received: by 2002:a05:6a21:7e01:b0:3e2:8c23:5d35 with SMTP id adf61e73a8af0-3e9283fe807mr10344582637.0.1793807220363;
        Wed, 04 Nov 2026 07:47:00 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4694a0e0sm1372632a12.20.2026.11.04.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:46:58 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: dmaengine@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: pl08x: Use the channel count from the device tree
Date: Wed,  4 Nov 2026 23:45:39 +0800
Message-ID: <20261104154542.3131916-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104154542.3131916-1-mmyangfl@gmail.com>
References: <20261104154542.3131916-1-mmyangfl@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hi3798MV100 DMAC is a plain PL080 except for the channel count: 4
instead of 8. The part ID does not say, and the driver takes the count
from the matched vendor_data entry. dma-common.yaml already defines
dma-channels for a controller node. Honor it.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/dma/amba-pl08x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 33ad6c42cd7f..9bcb4a3cd5a0 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2698,6 +2698,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	struct device_node *np = adev->dev.of_node;
 	struct reset_control *rst;
 	u32 tsfr_size;
+	u32 channels;
 	int ret = 0;
 	int i;
 
@@ -2759,6 +2760,16 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		vd->dualmaster = !!(val & BIT(9));
 	}
 
+	/* Read the channel number from the node if specified */
+	if (!of_property_read_u32(np, "dma-channels", &channels) && channels) {
+		if (channels > vd->channels)
+			dev_warn(&adev->dev,
+				 "using %u channels, instead of %u from the node\n",
+				 vd->channels, channels);
+		else
+			vd->channels = channels;
+	}
+
 	/* Initialize memcpy engine */
 	dma_cap_set(DMA_MEMCPY, pl08x->memcpy.cap_mask);
 	pl08x->memcpy.dev = &adev->dev;
-- 
2.53.0

