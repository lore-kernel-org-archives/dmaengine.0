Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694770;
	b=HeA3z0RfdqocIOA0Aod118yEAuZNS5rDXXwVa5Q4Q3Q0cnZ7oDGGGh7oJm7XhqSLgZnT
	 GW55Sp9A0mwQm4CXxJ1k1vRj2eNnRng4zHQMphfZJao9Ot9hL12XjywGVdTvWmAumBn68
	 GReGZgSDAq2brvEqEhfJ67NfjGerhGytUjJpFQfmHDeiMV9AkIffH05XarfXYJ7n+yhCd
	 VfzJZB1JayJuQ7Wvdz6O11rn7nNAF9gn9aNVTdDtsbzFkPBuD8TIgThFST/W+4Etspufg
	 MsvLIyREFDeMUWeybOHIKCE6EJua9w/JC6wFicSR/4dV6NW9yt1G9nC3qlgs9npp+Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
	b=RRfmxPACCjjytO37BgRn8rFZgc30iMPaz7koN+newQdBu03RpsZXCUkTHr+Iy6l+2fMp
	 EDlNxCTRV6GLrZ0DrWdGivgtfRxNle9CmO2SfeBlieYzLE55/qT3IwaOJdOsdVJZtlFHI
	 b3pcJh3q1IW+LqQ86Cl+rcDIy5LWPwiqc8EMXIxIar7iE2f46TBd9XCSVo5Yj0MmiexY8
	 zucFP2FLbwQd/0cPgsEsdeC/GougUTporXgAiY/Iifxz8yM6m0SrJDitfFOV8h/sJpCpF
	 LceCc4/C2vnUkosJtiEYqs18tuxhw8i/O6uYUPQQf4bIertGqtRmPKIELEtjfkz4yGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVmQn6k2;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D28606D814
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D28606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVmQn6k2
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2eb5251724bso9277145ad.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694769; x=1794299569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=RVmQn6k2Be56GRnv3kgo6y8yO4XYArI54aRhbRp3FlxGLJ//+tmPQREsSGk1U4FV0n
         2IWXAo5HckUek9BxECowcEiDZQ7kY/tx62aWhsCXzyQ36Xh1kx8YumvbK8bCoxF9MxMW
         gGC0YiQullx9OttnZ6QCXMC9NFPdMzh7TRcy9jMVviYLp8bAeKviPBCf2DknqDUJeImk
         7AbvUpE7aLfIJg9hvR4Xay9OXOP+xzu8Q9E6/DK+K2QrEHUXgSRbEDlxz1PLrWxZ63jh
         9jNfZMQAUJ3dCmC1Rsuk2+7kPCtFNsSJIP2nNO3kvZCJfYBsTMYS5+aoAudnzoMfQJD7
         JD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694769; x=1794299569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4U/3KUqu/qVdhfefKvegkeTdRkvD6adQTd3BjiKpMs=;
        b=poVMIxDebHzuV5nvBsDMyII4SEkNtltJM+V0YuAUeu27C/j5SQaTxr0veClM8AZDlm
         RJRyxVXu2/Fmw3o3i63rjF5B8ZU+tEffNm3JJ1yDB23+L3v5egwT1H6FVOPieU8cP7Cx
         ztc3RXTl9h/JH1+/q+Ym4AduM68Ao88bw4y3vEmAa6R4F8H174/f5LZJ6StwQ+E9/e++
         6znA6sYwPoiLrkBq4PWhzbtCYhqxXkZn1m+TQGQA26DEuKcuC4pNJqoOL0Av1YCEYLn0
         /5bALSZEnyB0hACx1/N2aNEK1fmnimhUbAzLS9Ab0hWWgR2kmXhwxAuaFNv+GkTi8Pql
         cj8A==
X-Forwarded-Encrypted: i=1; AKwUvBz57k8DhvXUSEo6MfnRRecqeSFk0uYjwM0CD4le30yEXcxHpCrQvEsVFHftj7La0PKDTiS0kohsiHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BNko7cDFGDkqOnO2j1HyYFkufPoT1DjFCU3EJD4t7XMlgYi9E
	ILQmrDhDBqglKJek7iSYcj5puFcsHndSorXDIeBuvABLmS0aUrbqRYXx
X-Gm-Gg: AYBFou1aL8dgx6x0CXmTpLrdV2pBkXhc2MNNmPmVs1gDEwbD2plV2n8JD+M+Py1Xjut
	Lcph5wB6c6iIgfRtGFxg9MVsyyKWMj93VhnMrxE986mdGa7IF4Up+bEVniLeWycaWoZCpj7eXzv
	zYYOyKLJkGuzZ5jS6u3Ccdjp4GVHZhd6Avj793g1w15bvHEA/TAe9eZ6MWS6JrVhe7n2Ufef9sT
	tN9ug/jET/plBoIcbv/nYaF+wkkGGp+dsAuGQaIRfNeflxQjvYrhuNZzLmOKqE6eAWKq26vh9fe
	i4KnrXPD4p96OqAo2hIvsi/z2wARIlSmsrsqBBUY+DsBT1Ots6S4/Xom2v8kueB82j/Ps51xHvR
	sAQmu8JrD0zuPOnHAqQvBnJYBc9K/L8LEzuoEUWuzellwKWspBEduh6a4FP1IYME/WfEXHQRRGC
	ew68zyjvilqRr2hbq9JzghWUW7LSer68bpw0R5hHvdUeez1CgAVmV6H7HRIn6VDMm3Y6BB5cGdS
	Qs1lYX1Yb1ZqyXhjFtSfOGrW2CCCdHxsUuTftd3pg6L5M5BT7Re5D8YIO9lRmGVplJCEN7ajnNS
	uKRbDhb4T1Ie+6+lzIFg3WZeufosHvOKq3nuWfBXSmtTTNcy
X-Received: by 2002:a17:903:46ce:b0:2e9:723a:cf37 with SMTP id d9443c01a7336-2eb364e0725mr114991555ad.50.1793694769016;
        Tue, 03 Nov 2026 00:32:49 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm37036785ad.64.2026.11.03.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:48 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Tue,  3 Nov 2026 16:32:39 +0800
Message-Id: <20261103083239.2033556-1-lixicaicai@gmail.com>
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

list_first_entry() does not return NULL on an empty list; it returns the
result of container_of() on the list head, i.e. a wild pointer. In the
Xilinx DMA driver, the prep functions xilinx_dma_prep_peripheral_dma_vec(),
xilinx_dma_prep_slave_sg() and xilinx_mcdma_prep_slave_sg() can build zero
segments while still returning a descriptor, and both they and
xilinx_dma_get_metadata_ptr() then take list_first_entry() of the empty
segment list, yielding a wild pointer that is dereferenced for
desc->async_tx.phys or the metadata app words.

Guard the three prep functions against an empty segment list by going
through the existing error path (which frees the descriptor and returns
NULL), and make xilinx_dma_get_metadata_ptr() return ERR_PTR(-ENODATA)
in that case without touching the length outputs, matching the ERR_PTR()
convention that dmaengine_desc_get_metadata_ptr() and its callers (e.g.
axienet) check with IS_ERR().

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065806.3175584-1-lixicaicai@gmail.com
v2: xilinx_dma_get_metadata_ptr() now returns ERR_PTR(-ENODATA) instead
of NULL and no longer modifies *max_len/*payload_len on failure, per
Frank Li's review; the prep function guards are unchanged.

 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..8b9e3a13e 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -649,9 +649,12 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
 	struct xilinx_axidma_tx_segment *seg;
 
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return ERR_PTR(-ENODATA);
+
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
 	return seg->hw.app;
 }
 
@@ -2305,6 +2308,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2406,6 +2412,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2613,6 +2622,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
-- 
2.30.2
