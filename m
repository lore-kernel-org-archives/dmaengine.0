Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694746;
	b=UNoUqLGpgGRyw01J4XoH3qQ6D3igyvon8M41VNA5R19SkbP6wxSib2bsarRK9sHqHv66
	 IIg6lJUFfwiuHiLrZjnZVCKD3255USjw/NLmWPlqFq8s5OMBd2cLRsNoxPhK2plmRWiyl
	 Adm1WpCYZPkwqwJFTC6Ci5YVog3Op+M0Wj5GL6VWtc7HJphjAWhSP/C7dDe2H5uVq1gC2
	 SEBJXAIVkAxWc+bITbN72WGIUN1CtsPlQCtQUiA3kNNTU6SB+bPW0Ooy4VKZDGoA4VnHj
	 zExDGesb1YOE3B/OVZ/WMlXYYqevtpFkjXxhSfJQE+llBsTBs/Wzepivess574nOTpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
	b=C3gtJh8QEEtgJShXMnKn/U9iLE6y4B4Bf8RoZOaoraWJYxf3DpvEn7ON1IcLA1sC94fH
	 eoHfGTyMCTcpY7a56riWh8TsrV5r0hjC6wjQdXJrstg+xh0iQFeKPDwvpQeenp6X0u/JL
	 gtstvfYbgKlYT+Y2EoXS2RNHfoidnJf5Y0QyHmjuIpOTcucqGVQCG+IW1QxgphmnD8CHg
	 clUdpg1U5JGIpTBaVOOjCTLap9ynB/OQi/bj8eRIe/hQ4Cmibf7lsg6zsBZ1247FFEL6S
	 cWn6yd+aTKCE0uk4YmqnSZLIIrqQsmNG7nl96CBru5HUw4VDH71xRSwDdOW0iJVw5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D86606A331
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D86606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2464767a91.1
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694745; x=1794299545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=N5fohdBx1NFB9AacLoSHrX8kbHCWs0MOFlRa7iGrfcHrdu9N2ICrvSNW+jtvWA/at0
         0iQUKX8LtCxGZmPCnF7TakoIIzG2QtQom9Y8mi5FybXTwj+yrGJXGzs3R4WU565xPvqY
         6kTFfWOGhnFahW92OPvWAuDPs/0ByNgGPmx7cjEX6Yn2ZPZ51UAxbhv2ExJM3lSrdbvl
         Aav+HOMNmVy3U9ELqSoyECWxI/U/gIdxDgbnUdc+DC1NhC/ahaLM8YV051OMEDk5whKE
         dVYmHjFaaptVC9InyjtJ6HWO+aL8rbE0u9GSswzao2FfSnqDJ513az1Guv9iat4lzrxS
         WT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694745; x=1794299545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=XzxAZFFcmYlcrKtaT2BVpRXd9d/AlRS9PyunGvwFGbxVw25O6Ep+QVKQtR8dpe4QRC
         XE12yA/snTvVzg4SLmQTJJx/ma1NxJ3bXT439klbCN3HnReDGaWENg6ymQ84/ZujJ5nG
         sDUDXhZZ65TdQ2T+2+cjA1h0Fjvf92ySMrhStGzHKNBzRLJeIOAWu7KeDkWnVty0iEAF
         nZ+ZFK0Ea30Hjk+4O7Z3H1YDbHFpDf8uTb4PSlsjkyLxG0AiRz+4GbsoB28Ote/BPsg/
         WyCByb3r0eH2ZlKj80Rw+RYnYw38EqTdr88fduImMGEVmcS4HpcyPYdsMlOXkgdb16D+
         M9XA==
X-Forwarded-Encrypted: i=1; AKwUvBxnWsSdrda/HAjh1oZY7e5bxiLPB82Mg30Iikj+Yi2wgK2b84xmfpcxIHQMRQry9/gAKRmWBIJO3EQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z99gFdWRi0gSvVIdc2PqFBLrH6jNa+RFutkGoeUD1aPap8kAv4Z
	WTvD+vkNiDZRpdGZ7NFfxQmGu00yxJP//sbP345jmip20E5eOD0227x3
X-Gm-Gg: AYBFou2+sgkTPXutRpxVjepm6x8jj3bKMknXhcSVBhlW8P9jyRg4uhDiN2xAVS1GZpO
	CgVicf6US6cdEO2mpcVorws/4CbnymVT6ofx8O2eNvh0qykjcEH9uyyI+6SnExwj2PNVmBFNEUc
	bVXrEHQN14k4UTg1JPp4PvCY6doptNXR/sFD+7YmFwPUHj3vugu6MXYYlgkqHO6hktK9r4pTTH/
	0yRrbl3F43gawjIwXn32XBTWi0ggCiKAzawr2oiTWTJLRVdhLfBcXaepAWz0m4NaYkRkk69b+ga
	WBvF1R+V3g1/Vwa31uvWWihAVqIykqvMMcMbQ3bL4xzY7dzm8dG7Q+rzt8kUC0xJWTTE262zx9P
	BCIm90NhdhgZJaW6X5RRYauNDLknutLYDwXifN+H5OOT1MPecuxPXJUEDX3w9QhsS26Ym1Qomy3
	g22M08sk5wTKB16y65HKPz3zbRt4PVJI4I7iWMcgy7Iefq2sR7678Whvg/uickOM+Z4PM7sqFKV
	CVuC8Heh8E+eOtjC9rWF2xka7TFrLudhnC3qRKYl9HOW+8KwqN1s14BF+cFFpaA99IJvIs5/s6+
	DlpN6gbrYMtc/Pld2EfbzLsvNICCzMdNaShiLrK7fkH3suH/
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr9133105a91.56.1793694745256;
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm3232140a91.5.2026.11.03.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: fix memory corruption when active list is empty
Date: Tue,  3 Nov 2026 16:32:14 +0800
Message-Id: <20261103083214.1682930-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not check if the list is empty. When mchan->active
is empty it returns a bogus pointer, which causes memory corruption.

Use list_first_entry_or_null() instead.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073154.744365-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2
