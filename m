Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520761;
	b=LnbwNbAWp65IEsKUdfX9+8H+IMbKCcnRzlGv+3tOSqv99xCsPoeA1dB/zup9K1hgU6ly
	 UR/xZmHSe+ZadLZ+CJnYYbkK8Tj6xGKekQXFQCNvOgDA7ozX1yYWlid0XrZ9gxAkbezR6
	 LnAz5/LtLkgVz4zMMe7NNfdSiaLpnD2bk4AsCLxGEXJkz5Sc0yBZPUgeETPvQYHKVpdHd
	 BtZvpQOuELElsgfYNYSk6XoOIWlwoHHiMBvVriw8cfqh54d2D+WgP0R79q32RVTRsJH2o
	 hpDLBfo42KYj+HkhEIJ7y8n7eaXVNQ1P7v0EJL4l7APf5GlRavaXyqVc3RrtwWAHCPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520761;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=II/o9tTTM11RKRY6fRgPyzKbooch+DLO5SDsdDjeAcA=;
	b=mMs6BYtaDs9G5J2TnpirYTW44j8KXDht1kryGzP2c37BP72pK50o920/lnmBSUjoyEQn
	 O4JXiHDASz1Tfm7RifEoF09j6vhja+3O1OemmdywD3oRglO+FIhKar/vG1SADHsjEcms4
	 o9A/+OBEqUUM63zZ81eBkYrzFurmlF06E2Lqhie92GZR4cN7+8EinM7Z/gtxOxjOwA/Sa
	 GDCZy5REuJc39Ulgcxf158R9ea2wEN/SpLD+fmISxVAfEWGdTMOmaIOTzrgk4fA9vr2Xl
	 tEV3ZPPtbKNWScAvWItQ+rtK/G9m3XbkoTczO1FECeiYwfmrpzaOf58QUJf09em7g/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1vLsymr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00947606A6A1;
	Tue, 24 Nov 2026 11:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1vLsymr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520760;
	b=Mne4yy04b32S040IdbHGDqbX0wS4qugDkNKZHXC+vBSoHXBWeUjgE7bLQ2YQNsxG63OI
	 nXAO5TICuB2k7KWkmlE4Po2VO1CCV8o0SmJkkvmtKyOlj3/Q+QscKfS2UCQfIrwnlNpRM
	 NcAR+RVjzAHRb5ZbHAd+iUEK5hep9okp3mbaAMUgOzMbHl1fot/RkWw3jHzmrBeilNR5f
	 fcIl4s7lhMibJWJXzOERLeGSeSVOecnDo5bXd2sNeOYQThcwDyaUeTMPW3Z1rt6XxZ3qM
	 SFvhHcX8vX3IppBH/JH6IOmp6+g90PNzvEVd0S7TnQH1siL7tWG8+Tz+T81EPdzyTSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520760;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=II/o9tTTM11RKRY6fRgPyzKbooch+DLO5SDsdDjeAcA=;
	b=ZXSY4gBXLYF0W8CKhK1a8eR2NBz5GCO/wXMZ+J1Kt+R4nxWz8kkh6SUd40pieRC5HPwX
	 TN4iMkuUeuHt8PNvr35Ne1buFqeozgGROWxO2pkFwhR5Mh3gmfxF3tOjv75dWZ4b9UJT/
	 L9eE8p/hzUYTyNpa8Azb2RgGdbSW/toePOyJyJ4Umkt2mQk0HBC4ZTN2yvz1shU5L1dd7
	 sCIZfsFgPTlH2GzOtWpqys65Pg9JBPV5Y+Czp9cTjiaYGtASJl9qmNu/cDV5vahthFYuy
	 Fs54bAgXyt95qzCqfhIhLwcFbYXeq/O0ucElqULcg5xR2Z0XfpERD88pvxig/6kTY3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 643C71F000CF;
	Tue, 24 Nov 2026 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520760;
	bh=II/o9tTTM11RKRY6fRgPyzKbooch+DLO5SDsdDjeAcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f1vLsymrO1wRxr6zpJVfXenkOUJoVHzRBMHPNvvMdndlhsUz1Ys6znhv5InXRzAzq
	 nM1XTcRVsKvn1GZxBT9ZokNl9FCv16JtEg1mmFjqTVldFp442phU5Q/i1L6NButG6Z
	 BSn+9wGKZnoFq4VBVsbJ4kvOOTKqgO2tBjR05ZQa01Bmy/M/6Fjx7532EOLbAePuw9
	 oL+C9Dq3pfHJ4t8LIetG3KhZJ2ssKnIW/GFrZgpwVC/vzzAvsELDkigAj1eFtFvK5M
	 II8Ba5DTUtiDRJ0iRIvqZQtz0mqLNPg2KOyqKa4PSZDANvv93XdlKSNciyc+pbGr1C
	 4Pm8rFZq/D40A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E31D4CA17;
	Tue, 24 Nov 2026 11:45:28 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:14 +0530
Subject: [PATCH v13 12/20] dmaengine: ti: k3-udma: pin owning module while
 glue clients hold a udma_dev
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
Message-Id: <20261124-dma-upstream-v13-v13-12-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=3775;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=O2aPL26t+gNCqmeRgaGGYW+iqPg35NIXwOL2Jd6bS/s=;
 b=BN9Bh4wpa8J6x5TiTjGYx81QWGdU93XOjA2I9YUzlvnaHw41OLEzgVAAVUhF5zxDL70dJ4PsO
 ijxngSrU0N6BqyHBCJgigZCY+KEjyMSTWld7EyeSUplcrsfXASjeoM6
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

k3_udma_glue clients obtain a struct udma_dev pointer via
of_xudma_dev_get() and keep using it afterwards (e.g. through function
pointers like ud->psil_pair) well beyond the call that returned it.
This bypasses the dmaengine core's own try_module_get() protection,
leaving no guard against the k3-udma driver module being unloaded
while a glue client still holds a live reference.

Set ud->ddev.owner so the module can be identified, take a reference
on it in of_xudma_dev_get() with try_module_get(), and add
xudma_dev_put() to release it. Update k3_udma_glue_release_tx_chn()
and k3_udma_glue_release_rx_chn() to call xudma_dev_put() when
releasing their channels.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-glue.c    |  5 +++++
 drivers/dma/ti/k3-udma-private.c | 16 ++++++++++++++++
 drivers/dma/ti/k3-udma.c         |  1 +
 drivers/dma/ti/k3-udma.h         |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index f10f61a40f914..34b282d9a727a 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -466,6 +466,9 @@ void k3_udma_glue_release_tx_chn(struct k3_udma_glue_tx_channel *tx_chn)
 		device_unregister(&tx_chn->common.chan_dev);
 		tx_chn->common.chan_dev.parent = NULL;
 	}
+
+	if (!IS_ERR_OR_NULL(tx_chn->common.udmax))
+		xudma_dev_put(tx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_tx_chn);
 
@@ -1258,6 +1261,8 @@ void k3_udma_glue_release_rx_chn(struct k3_udma_glue_rx_channel *rx_chn)
 		device_unregister(&rx_chn->common.chan_dev);
 		rx_chn->common.chan_dev.parent = NULL;
 	}
+
+	xudma_dev_put(rx_chn->common.udmax);
 }
 EXPORT_SYMBOL_GPL(k3_udma_glue_release_rx_chn);
 
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..d2501e074bcfb 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -54,10 +54,26 @@ struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	/*
+	 * Callers keep using ud (via function pointers stored in it, e.g.
+	 * ud->psil_pair) after this call returns, bypassing the dmaengine
+	 * core's own try_module_get() protection. Pin the owning driver's
+	 * module here so it can't be unloaded out from under a live glue
+	 * client; xudma_dev_put() releases it.
+	 */
+	if (!try_module_get(ud->ddev.owner))
+		return ERR_PTR(-ENODEV);
+
 	return ud;
 }
 EXPORT_SYMBOL(of_xudma_dev_get);
 
+void xudma_dev_put(struct udma_dev *ud)
+{
+	module_put(ud->ddev.owner);
+}
+EXPORT_SYMBOL(xudma_dev_put);
+
 struct device *xudma_get_device(struct udma_dev *ud)
 {
 	return ud->dev;
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 8a8e2b5e0f473..1df869ecab2cb 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2693,6 +2693,7 @@ static int udma_probe(struct platform_device *pdev)
 	}
 
 	ud->ddev.dev = dev;
+	ud->ddev.owner = THIS_MODULE;
 	ud->dev = dev;
 	ud->psil_base = ud->match_data->psil_base;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 4dd597ef435b8..65243c9ad1346 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -656,6 +656,7 @@ int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
 			    u32 dst_thread);
 
 struct udma_dev *of_xudma_dev_get(struct device_node *np, const char *property);
+void xudma_dev_put(struct udma_dev *ud);
 struct device *xudma_get_device(struct udma_dev *ud);
 struct k3_ringacc *xudma_get_ringacc(struct udma_dev *ud);
 u32 xudma_dev_get_psil_base(struct udma_dev *ud);

-- 
2.55.0


