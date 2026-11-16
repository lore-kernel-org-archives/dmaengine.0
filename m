Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808886;
	b=cijaGeXVP/HWNoWacOWn+DbZMQe2CPO7MDj6kSuYBJljLlT67H5qJDj8pX7xb7XwSGkF
	 wbygzkb5x0yS779cOl4K/wIXa/XOmDOvHuKzEpm8SBt5H2rjbYpWASUpoeLIFXvV3sr8e
	 FSooOgXGwN2CevOU9AYwTs16flUvp+23pdlUqUajUVnCnqL4cGU8bTomHE8CqYYaBaf2Y
	 WL7cgJq4Vvqgf5A2R3dziaYc/KDt3j8MC+UCdxatEigvLJkM87RLjFaw+BcIL+YAO0gxW
	 FYUMx/qoN0B82qqEbSqdrpOxmfuq1VTBgjMKglgqWT35VnHQpdHSrBPAu7DgXaXcN7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
	b=CONi2bqJek0OH+JaZ6+HVNP1i1Gyt+TOYrGOVUAupMd1al+PDimICYGFOwcbxu1wr1nv
	 /of8W9kY6H4GjypUJixVgThGvgtKrqEwgdNDx/+V+ykUzDX+yU6Mj+o5HWJnBDxtG11iZ
	 Rgvs4OaxOLFF9Lfaoox9JeM3ZXILvKQb2xaIptOA28Edjc1O304DUKYosORjyRa3Ix/Ry
	 0hpMGDugeWrddpAeCSx3MQCEUM2YoEX5CjO9JU3H6WyiycSDfmKyOW649i+seAwg50ytZ
	 LXVWMIzkW/SPioHLOIhh2tox4fD0bciM+nV4CRJOf0k1/LVNYtOGJrOEBe8A3J8L71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6XvqaeA;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C37606A338
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C37606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6XvqaeA
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-847ac7ccd85so2524761a34.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808884; x=1795413684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=y6XvqaeAgMOxYv0v8BB7+Wu+UQNZFH/xHAgJzY6HQs5trUXn9HrQwoV6hmuyfNtHJX
         7SEKNSqCmxYdkuBRDBVVf/m2o0Qg3wCBHg2OLno3G76gF5Gidwichtd7mT7hur7dVMXc
         KsIH3mzgVeH2G+St3L+FgaDAjz7g7OPFSQoHfuawetr8ORMR7rLv7rfQE0FVo0ZiOtFX
         2fiK5ks4kztI9dPuyd0Mx1kPRsdV/mBi8CyygzmWhPIyzsbn63wHyvdwR6UP6ohWIS+y
         tafeS5MukjdHDPJJh3qMikD28yi5kQUWA2Hisc7/PdRDXsKIwG6OGkINMRIcmGM422UM
         KdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808884; x=1795413684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZsB/3h0Hi2V5kBvRnVnvINwTmkVKxUCHl38ser2nf0=;
        b=vfZZghbaFL2b+xvMehN0oL4e8mOdSf3urZtE/4+7pO1uy1NULROHX+jmT3o++uONA6
         u/AyJlB2vaZ4TiO8ttLo2xOJfm70jXS17MNidSjjZ2IjziQxp02hzA1aQzFPLZ7UJtg6
         u4GcDdDnGJ+ts3lTGYjlwzokyqBNJarBU35i8SDDu166dB1IenovfZRQvsFsf90C6ZHF
         cxEK+yFcMJmHOIq+2JQNqzfni7HpkvpyZd6HAzTsD/wcIkbo4cXhSreuXIzgdhCMGOcb
         LUB/MIf3JfUb0PxJcXP+V9z/ERjHItEtDU7kAsqgsfPDcL9IBT+ghOrxAzfdhQDIKp7j
         Ypzg==
X-Forwarded-Encrypted: i=1; AL+hErEa8D8jzvIH+Jh0Ry0H7ap4pEKBXApkHam38Rp+1lRHMEgXWsZab+KhB3J5V9eyLcJt/PUbAaGjdd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FaDx+4OEYHZhw2Am+ngC8jIlibGDcfCsqkY5ge3iG6uyaMEQv
	IM6xjyC1TDZ/0Nlh66BxrywZ9b9Ud3pCatU8kcUY/lIjOlvfRLN2URy5
X-Gm-Gg: AYBFou1UNRN3Jwtfz5Bbo6mZE7ex6sftjg1LF08cmYAmlJhAd0U5khpELG0z44ThqEH
	KIgs9+nJC64ocKZHceofswiriEJCqSddxkFkjnVTzc6ig1G/Is0XsmzDHrp+nbDlI4PFSiAbZch
	zEH5Uvd4ZfTUSRvoupzYvGfrqwH/adXVyCJ243j4y6s8RYHr105RH+yZ23VOtwfyrQETymuFDQO
	vkizsc8cuYE4uuh0zO3wpaLSjROdYLqMjPQxUkK+6THCM516vgJY4jIXKNeKkW4EpGPsWMm0OZK
	6h8ecd1ztxpNrAPxMstwnaINLb/cui5pqvfMQFRiiGuEVZph1gejV5bIYvGqSGAz1MZcAbKxoIR
	Jut2mA1RMgzBc7Sif449lZjRrm2F+i2/utrHLSyBiMVrOHF5TyXXCm6wS9s8zSleeJP1uR6aO4t
	/PVj2YpA6JMusNRdQEODhBkkzGSfYtcBxm/AQfIPy++cYU/0PTlienqvtZ87s1n6OlbQ7DXXgPG
	KP2+NIx+1jBsnFO0aY4flHAVz4wsrMKe7iSgtjqsyytYb+k6I18QaDujXLlspXynnWGtXeAmT3c
	iBXb1ga+U6FGpIkRLdC4ZfNGCRy9zK/ICancUJXwH45G4aj9n6DylF+thgApM/XxaGVUwQzm7Rd
	6kyVE5LBb0FH1bopkwQCagEAkMlpc+xML8G/D44jJsMgn3orFiBZilgPX7POjO1lqZ2znXdogKo
	Ct+Dpci8YEGdVR73hmH/ZsTNK8NFAe3SNP6IFM1X5a03J7Iu4VJxg=
X-Received: by 2002:a05:6830:2b29:b0:834:b015:ae9e with SMTP id 46e09a7af769-86289859955mr8776089a34.12.1794808884380;
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:47 -0700
Subject: [PATCH v6 6/7] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-6-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index cd9a5b45d295..97098367535f 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1203,7 +1203,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	unsigned long flags;
 	bool enabled;
 	int ret;
-	LIST_HEAD(head);
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
@@ -1224,7 +1223,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	vchan_get_all_descriptors(&chan->vc, &head);
+	vchan_terminate_all(&chan->vc);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 	chan->desc = NULL;
@@ -1233,8 +1232,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	chan->cyclic_restart = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

