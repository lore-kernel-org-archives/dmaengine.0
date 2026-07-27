Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242742CAE4
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184267; cv=none; b=pvPXPYAy74iJ0/W2LnaZWI1MobXd+MqikNRYFWJwRFrcnJ+OOcO9GpTHyJY11eKG/WnLWeXn4ihhuAWk5CG5b5N1fYzKMF5UO3swkWF5FWGAVHfdPCnWfQkhC2aK9UN/eea8l/inIIfTZQttNAYrBNDd2mJzHHHt1ltZ01nyBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184267; c=relaxed/simple;
	bh=52mgaibdl5c58d3AYAN5WRtXVWbPgmpaRi1q76IfdMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQZ2rginaixdb1QiQxw4IUAln0Nx+OXafjLykCAfplANcp9Y5sxFK2dq9lDFqKHAGrqEOrGpJeSarbcsqRC8O4YpUPom4K8jL9fv7x7hkj1KtDMxTLKiDwWNgof4QI85V2bRtbGeJDQI7TKwHILwUYHVbgzSsvbs5GbDFetGBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxeGB8xU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxeGB8xU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca0c5799eso29752505ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184265; x=1785789065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=AxeGB8xUztVJYWS1tDkP+zOkHYGxR4OFBN7ZdWb5CNlKMOfzg0J7p73Ns+Bu+0TAog
         eOrMNFWQhjGm4JROxI8GJQiVvT29iJOWssBy6NJUQt9Ix2h20Zi5nFb5ixRpf/NaEUcx
         nl/3Htyg3dUS+erkXfk3aXQhcnD/we0lWih0pUAxaizFH2hOudN3zV9X+a9Qkfd5halT
         IB75vs2WtHYy1dBYKI5t4KBEIgJVSuBHjnMXg9gEypwgJdr2lIftnAH/11n1p+cT2gC6
         M0+yItEXzac8zh0+Ir31SAZXB9brLz6DpEV5Z/SZ71YEVzFesbSi0Iq/K+dOjnjhExsR
         ZrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184265; x=1785789065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=hYiMbEZgfNakfzhed8I0z/0bztCcrEv5FiVNfwNzZr8v39NHUl6JTyWKI7J/KjzQjU
         2Db4iFgcYIR7HYvnSAeaLwurr//Df9zbG82XRQ0I6H2WHqfRKHWGD0cDEJ+a2vH8aInD
         kY64mW9rzioY+nKWydkxvDxFixzGlDTGDhkE232E+4RGhg0NL/0hBr6JE781uDHjjwwA
         SVBfgU/CkcRhEzxjMw8l97XKS7NUHWVSGSgWqcBr9tJMCKoMQnB01KyC8eGlO88a6WPr
         1Xfxt4GjMskhTxhNjGpy+TiYksfpxw9OYkMPAKdhr/+Xx6pIDBods3nBhOGB60DG/hr0
         7Wbw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/POYjP6nvOl9jj5pOUKlrj1/2PClsJz18IWyupQP161eqFciXEx2z3D5QfLRpnc8cNcJmmitiLQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bdv/Z0ve8uy8Gs5NsdPcOXwu9eBEMZp5Wn6i3hOYvViF9XKD
	7coHNTJRzk2DmgXQWLCI8Xbav/whC4bwe98/UD3P3iQq9N4dmBaeTK6p
X-Gm-Gg: AR+sD13gTxHR8O8CZ6DK8NUC+Vd8XNGsuLHppQ5Ebhybb1MyK/HSrIamZOewGSLvGAX
	FjJnTQ23+aMx6hcLch9dvb8WsMBCUTaHYAXOsAwvCjoAK6GxDrO4mbkoWqTRxUyCH3xSBAsOUWn
	VJziZGrQdT21LDS2F5ZS/kbBEEa6W+HzIvdWrUmMhngA6Dt/b4sfShmDE4NLwlF+KcJU9LbUnNv
	pNr5PDwU/ztca3glR4MBIZYJJsbwptjsR4GfcqRXz+oory5ikA6t27j7p+pC/WhmflUDYNOghNf
	TPO9OLKzxfrQox7d4/H3zlHOV56jmo9ibcnbRG6+28xyLwJgdM1Xbvmpuc3zUWSJtbXWpCv+slD
	vAjuISeyy/VYBLzsp9Tcc3jJb5eOmvbb3NEIDaxRjNWsDnzoa1mpYP0r4wrSWdA6x/m9IC0y31n
	6IH6Aq
X-Received: by 2002:a17:902:f547:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2cfde7aca4dmr86641865ad.18.1785184265001;
        Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/64] dmaengine: apple-admac: use dma_chan BH callback
Date: Mon, 27 Jul 2026 13:28:31 -0700
Message-ID: <3804b35d529e0b80d8d0898f1dad1fd4cb917fcb.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..84483247bde6 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -89,7 +89,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dma_chan_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dma_chan_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dma_chan_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

