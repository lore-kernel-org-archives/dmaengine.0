Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792832721;
	b=lPG7nVkVsr44BqLTyig7e1EJ6ERF1qiJ6a4G/s35SJlTJ7AE0DWdGg628FNE8P0YZaUA
	 Rv2KMiiE9F0eUw8JHrIP4+iRPM3UjvHP8VNgrkGLuTuBbA7tbQ3xR7CQR29uOF+QgrPy5
	 nBgne/bOpWm8RKV6loxdAyee++RWiPRQ1ZOFio796wowfjvfdHpgfEpE1P2ebl1T5qnuz
	 bThWS+sWwyRylAncpoJStlYXfFNcbymkwxKBC+/f1pnYl0vgAeVn8Y3tcNn99e/t21Vp6
	 U0P6A6bqg9Ez997hIKYgNVy3TqPHiW3sHvhMwg2vNcDUx5tiXAQW1POYqd80ngJONFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832721;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QWkn/xlVHRiRHb499IBZuW+PIveJv2lg7thsC4TJ6eg=;
	b=sb70gGoqi823iNeQ6ZCriyrS2Db2J/WvRcoevEjW7lIw8aPZtP66ddGFDL5u75OBvZj7
	 /LsRzN70tf1Plu1L37WgIHZV+W75ccl9gzk8HIr79T3GRndKoJzZpmaNP9RKzvYbLQwPI
	 xXGx8DDH094TMEtad7V43KpZVAYij9VpGGQAlJ6ykXQ76kw44w9lWODy3yvB0U4GETcbK
	 A9hLLDwoUsZbvIO9e8VsnbEdfulI6nrgdcOtCeACrGl1iKcm9svV2jwqLl0bC0yBLzfXi
	 mAbwSOzveRkjVo8zELOspxQUSW6tUieByMnd1t1mOcRwlFEV55r7fJZGOWvoT3QnOGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CchQwBVI;
	arc=none smtp.remote-ip=80.12.242.13
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46107606A31A;
	Sat, 24 Oct 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46107606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=CchQwBVI
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id KXghxPvvNkwI8KXghxaElh; Sat, 24 Oct 2026 11:05:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1792832717;
	bh=QWkn/xlVHRiRHb499IBZuW+PIveJv2lg7thsC4TJ6eg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CchQwBVI0N6no9inzOgf1a18hq7H1IK9SKCyFxFx/6P+8EIL7aL7z6FRFVbkZNdoh
	 HVEGzh+YabO/yoV8q6ryMwmY4Kaq0UyiKCGU36J9XlQpO+UzpPavB9vv/S7HVUJjSt
	 eq+xd4iKC3kdOIdvu5q53e6V3w328Jm4nmH0T8sNyWN9wru6QQ5dyHBoPKV2LnaVWO
	 53U8eQ7btsL/h8Sd2X6tOT9nF6e5hEScfRp77awMLSUJDTWFMW0i8YTkiAWoDJbKGT
	 g6EDL4OiSs+Hr1945IIQF1UPxhN0bK9GOAJPrg6tvRR9wQazxrdK9Hkp+zvx5f/gu/
	 Wv82SZbbvRqVg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 Oct 2026 11:05:17 +0200
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue() at error path in aml_dma_probe()
Date: Sat, 24 Oct 2026 11:05:13 +0200
Message-ID: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.56.0
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

If an error occurs after the alloc_ordered_workqueue() call, the
corresponding memory is never released.

Use the managed version instead, as already done by most functions in the
probe and simplify the remove function accordingly.

This avoids the leak.

Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Changes in v2:
  - update the subject   [Franck Li]

v1: https://lore.kernel.org/lkml/93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr/
---
 drivers/dma/amlogic-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 684121d13fca..791bd82743d3 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
 	if (!aml_dma)
 		return -ENOMEM;
 
-	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
+	aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
 	if (!aml_dma->free_wq)
 		return -ENOMEM;
 
@@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
 		if (aml_chan)
 			tasklet_kill(&aml_chan->vchan.task);
 	}
-	destroy_workqueue(aml_dma->free_wq);
 }
 
 static const struct of_device_id aml_dma_ids[] = {
-- 
2.56.0

