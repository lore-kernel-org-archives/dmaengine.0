Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316594;
	b=hTyldrwoPhBToVbsygQ37YQih9n7ifbt/B27S5R8wdVbauOmCT4cV2qoFFOW1AR6clu4
	 +spbFNl+Umf2q1DUHOoWIUiIScgntUT6IKufYTFhowJSmrIF/Aoxh/MwtGn1PtE2j/Gp/
	 4b70A6tQGga96wfhnVYaHB47c/uTyaYZ5WiU3pt1EmEg/eIN9yiCvtgnUYakM2f3Nx2tF
	 OF2LWDfkW+qv9H7rLk2z7iCCp+EWONBMYHYjj3CCXJTYVDAexXnvIt4lY/IQrPFrEkjHL
	 nvbKlowS7r/wqsTwmlAOiu4NfDZWjUE6BwZ8gzj9rF7u4FmqPuX6IGej4rncn1vRPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
	b=LOUSrRXfVX+UQvNLyq9k++HGNDMfOqAvNQS+G+h6juKskwlpRXZCGS0jDb7rODEeUOgJ
	 GZQrKvKi7D2w6VuvoIcWoHAHze6QGYrwllCn7FcthYLdqeOttCm1bJdf1c2M7ag166nrz
	 aJN4GePHDs2E7gyyXtN0RwXEYliaXiT/ULXkidpBtHUnYE/NSfHz5+yxcvlGWMT30veH/
	 8E6Dtei2V0Pnzb5GuioHZ1roS1k/hPNsGEECdXDj9YQ8cPkFYA9fMr5kSRoUciLRl8NbP
	 bCn2YI8eB5B4oiDgdvtAFLwOTrTNPdRCNhLV1h9ef0Zenndh10mSBlhOjWIk/YaQBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRJJ8rK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7710760A5BCE
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7710760A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRJJ8rK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b17b277a68so32361a91.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316593; x=1794921393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
        b=jHRJJ8rKAgO6YRkN44UOmVIERzAKm0mfzJm0H3BzCfUBc+9WYNXXdBm76G5ZwLoFFj
         XZI5c8V3Hc8CJq1rylu7wVKiyucvanSb1sr7ar+PmI9fG+p1fxbyhCrymC5Q/xzXvZCl
         19hv9EXpBvtjyz2eh2suqyz+4pYY9r+UcPTK8qsEdBi61o947ME9TWM6NVcy5hk83Cwx
         qtIHb6NgFGmZsye+KXE0Ifzo/4vIJeiu/rrT74O6dBXBs7ZICy3tZRo4c3qveYMt/M4P
         mqFBSsbz+w4Ey1Vc+21owlgCIimTzHRC9kKLLwOTjOul0o0f1OrJtbMfY4pOawhr2RWq
         SgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316593; x=1794921393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
        b=wzgQrZx+9ou+bSpqUae7CflclhkKy2IWuWUgQc55XoI3HAbSJHsEoIpbPzDuaxbnUC
         I45iMcvahuB3chC0BBFmMuz77CUj8wgfIuqRZYYjhwTygCLmti+MKXKVEtjDcWyXqqbI
         gHbNVOs3ROqlf+KZ15q7gbnCQ7AQF6g3Y2gfyOx5APlwhq4/drEVlo7dlxXSppcMS9v3
         +/PVWHOVPpYTE0UGoZKKUDqmPpl4OvMXhMT+jyjGPoT7S73FUOiWO3TZRxF20MAQNN4Z
         3h+VWnmUB7T/50B1v54xz/ExQPw6ixpWUsEFIJLOGLACwIwmLkpXS049aMzq9iqsLyQK
         NllA==
X-Forwarded-Encrypted: i=1; AL+hErGofjPnQ7miJbKCQXygiD4LstBg2fYUGrGWi0ZTEoMzSjxfIU15xWU1ybqgYCNH3YsfOIuJD61imsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PhFJ2ucUR8/Ly27HA8zLPz1o43dDosSvDpK9QlNzsJ2sy+YdM
	WP92A817aId5adJHsouznIsfpJ6Q+g3/SxYuheZUJx+5rOt0jOXbSWDv
X-Gm-Gg: AYBFou0j1fDAbFfelAJNgIBIyJibWm4SOULC1DuKWFUi0zePP+BC7ZrPiw7dGPvH+7r
	E6uVbrC2LQ4HFzQFBeXddvJ3pQVvaSBU+CuOG1VEX6Za1nUVJPVOuE4Fa40ay81ArIR7QdOlVEL
	wvXBq0pla2UXR1tZZh1MZTTDO01psiNRj2gjE6rYLOxBdTcbRq6Xctz72PB852py8IPoCPQL4gK
	XH+aY9Bd/pPvktUETDvuvrth8ifEI3WYBObz38n8VttVs4wSXK4hkDsrEoXUwIlmxwNcd7uVgyQ
	zrn1M+cv5/rb0iBun7n7QORWnR0cBuyTzAsV6WlHkOJSo5Nq9L7QPIjpq/cwYz93i+hCjj4fhwm
	3esDU563cO+c9JX3QVwHJJm1Funob37MDMxwb+gcdjnSaWPAUXm+dijjpwezMFY5aewJZvzZtWc
	uAclIS1Ln0ctYrLvg4rNj3tgjG4gbgmgSFJQ3NJc8i6E2Iqv9kI+TlC51nt+7F8GvAwtK3XdQjy
	Pzl/ZsDFvFJOdeDLL7BuuBV2FdZlEV/1Kjuv5NJ8yvwDcUG/sczSOL+EoJuaK1rrm+3TT56jNPt
	ktnOxdZV9kuchWjmEGkL37jkNv24bxY=
X-Received: by 2002:a17:90b:1c88:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b166ce1cbdmr2477769a91.52.1794316592783;
        Tue, 10 Nov 2026 05:16:32 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:32 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 15/33] dmaengine: pch_dma: convert tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:15 -0800
Message-ID: <f6df749807fe5f285ecf4b90411440fe24583e67.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/pch_dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index 88baf7ffec37..28d5e25d904b 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -91,7 +91,6 @@ struct pch_dma_chan {
 	struct dma_chan		chan;
 	void __iomem *membase;
 	enum dma_transfer_direction dir;
-	struct tasklet_struct	tasklet;
 	unsigned long		err_status;
 
 	spinlock_t		lock;
@@ -660,9 +659,10 @@ static int pd_device_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pdc_tasklet(struct tasklet_struct *t)
+static void pdc_tasklet(struct dma_chan *c)
 {
-	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
+	struct pch_dma_chan *pd_chan = container_of(c, struct pch_dma_chan,
+						    chan);
 	unsigned long flags;
 
 	if (!pdc_is_idle(pd_chan)) {
@@ -702,7 +702,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts0 & DMA_STATUS0_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret0 = IRQ_HANDLED;
 			}
 		} else {
@@ -710,7 +710,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts2 & DMA_STATUS2_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret2 = IRQ_HANDLED;
 			}
 		}
@@ -872,7 +872,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
 		INIT_LIST_HEAD(&pd_chan->queue);
 		INIT_LIST_HEAD(&pd_chan->free_list);
 
-		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
+		dmaengine_init_bh(&pd_chan->chan, pdc_tasklet);
 		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
 	}
 
@@ -925,7 +925,7 @@ static void pch_dma_remove(struct pci_dev *pdev)
 					 device_node) {
 			pd_chan = to_pd_chan(chan);
 
-			tasklet_kill(&pd_chan->tasklet);
+			dmaengine_kill_bh(&pd_chan->chan);
 		}
 
 		dma_pool_destroy(pd->pool);
-- 
2.43.0

