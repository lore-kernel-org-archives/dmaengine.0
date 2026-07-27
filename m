Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA9442D767
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184837; cv=none; b=W+fNvxqNZS1qeImTe90KQUddcWmFgC4LAniV18P+8MjnLHXvtdYpNH79ut3Qm++lwiU+sCqXg3gvQjxoCRNLxp5vTYOHmxvaEIgocirYD2+d0n6PSEhsLF5UiCd+Vh81llGVV/hXggFdD2jdMSSO43yIj90MGV6RwtEg+q4pMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184837; c=relaxed/simple;
	bh=N8WuSkHIr8cpGRFmrHSddr/VxgFAmae/TguOVqZaqVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7Gkrz0TMcFzuwfdUFbYbxNijZKK2DhbuJ23Zsw/OJSXv+mCb7H4BtOxzsGxT7KhGW6FVjV6ZgBoz3el4M7ku9BY7zoWgQwK75Lymj8n1X4r3YWnd4UoXnmjfLVRmE2PwjuBtP5ibPC2J8IW7NzojCVvGgPi/hiRDHFX4U0544w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La2jJY29; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La2jJY29"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e507b079dso1816656b3a.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184835; x=1785789635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5gaDUFMjFsf2p7Cgms6fENCmHCCMnNOp2lQps8mOFU=;
        b=La2jJY294CoP+34Ab8vO1bp+YFnGKA4IIcSurpajvcx6l30dl7c272fe/eimhJB20y
         MnwvR5n6FTmHckTI/5F97t9PbzobVuVgiGFyNk3wTD4/aUdDMzPxm5OqZRVIHjstK8VP
         uxJrjgSEb6XIb7oUNfHby4dbQhHxevow2rwaPC4svMYtMZ9y7cLjBf56Zoh3wzA9lGXY
         ZzDucaZ4lc5rneG+sOEL33SgbE7cOEnquhKRvGH9wVRso3kVjyVzftZ76rxYa7nXOEN3
         LTlVYzaHM4CghKaAXTBq+JVITGgJG1LQk1LZpgPo3UtXlepg8iDA8XcvXq0cIUCqz8hr
         K6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184835; x=1785789635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5gaDUFMjFsf2p7Cgms6fENCmHCCMnNOp2lQps8mOFU=;
        b=iohb0lfw4Y+IBNhjnaD4UtQvIR72YnSZ5g57PxA4PzGmT4W8oq+QeAnfZMm0H+ts6F
         Hj5a0zQHxolhvlWLuByad1LAmEvZ6vMESsH45o01BI1NE8L8y+sMdtaatUfISpynmolg
         gBFA6VGCxbQE/SpcKOJLYd+NgN/m7YaTXQK20fLF2zsiRN3hDnY3Mj3rt0dn1XkvVRY4
         PPdfI/rF09uzQHZo9Y7bfvLnCRCofrYLKew4QJ8qLO/xWHcsFcvlXdFVc2jN0xLHv/Bo
         PX8CTKKWzh+3eF9CgolyVmdHA3pC/ffWyzK/exIA5Wvd5ccntz/6KWOezHxBGJL9i+va
         kbMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz0dZFpT1cLAyVvp/wa0eWmUthZmy0NMUUbIG0V0BpLN8240/fvTDvo6ZEtwsZuWGyOR1jVKaIACY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1ao+8amE1x2Bn5dKDIvHKtCKtYDXPzZZJ5vVr3/79x8IQC6s
	D1rhd/zJgCPfbEk3TQuIDPeOHgYqj/YdXR22YFJNiJ9lYVVg7+r3Obk2
X-Gm-Gg: AR+sD13OIvYLWiwe1b5+HjuW61falnp8VT9ubRuBbA1BqRYNB6Vp+zPtGsuhQiLOtNf
	eIxyGHZ6P5TwDnJmLdJcEQs4Yz2CJ7AudCzeRG52BjF1Bh+noXgaafZp44YiMf2ubHNUdrnzeEy
	U7Tw2aueeXfdAr/tQuvpettR+E/fetcWftnw0qeYAYN2FXTvt55CK6s76dD5jZLrZO9xUwgDwPF
	6htMKO2RjhjIFy7CJZ1V2+1ji+SiG/0Qh055YgMxII3YpWH/G5TEizkfAM0n2Cfb7fSK/I5u8vN
	CvWGP/6BTxoifNldngaNEi//KyHkSndhIM4khS749JB8jE1i+SvXoGIs61aohV0TX+N5HIDpwEb
	5Evgh6i7LNZucvgMUyT/kQA/uPGRTyJBdB9uLKFx4aSqdAXmRVknt0ykC6tDt7Kgb6nXHjmMwBs
	82AKly
X-Received: by 2002:a05:6a00:22c5:b0:848:2f74:d8d7 with SMTP id d2e1a72fcca58-84e595d7b61mr7910310b3a.72.1785184835278;
        Mon, 27 Jul 2026 13:40:35 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:34 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 47/64] dmaengine: loongson1-apb: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:09 -0700
Message-ID: <22694524f7cc07a687d0f1ff7957af97fa51beb4.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/loongson/loongson1-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..7fc77d8e6db3 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -552,7 +552,7 @@ static void ls1x_dma_chan_remove(struct ls1x_dma *dma)
 
 		if (chan->vc.chan.device == &dma->ddev) {
 			list_del(&chan->vc.chan.device_node);
-			tasklet_kill(&chan->vc.task);
+			dma_chan_kill_bh(&chan->vc.chan);
 		}
 	}
 }
-- 
2.43.0

