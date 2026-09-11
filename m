Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB64BEE44
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163961; cv=none; b=cLEtNIHwvyBKHaw2pK2aBblriRHYqlilAUSQHFvuEd1jyChp+bfrLz45jYafckdcJG6Z7C7w9y17VBvDcBM4PsMNoMQvnsCJtavlFPbBsTowy7+8DmOIvkkKF4KHux8kbrug90q7tUTrQzi1CnGJCgcssfMHA2/CkQHosmRYgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163961; c=relaxed/simple;
	bh=JMYRjmReUqjs0kaCd/zTtWskNw+74fFjHbV7Fsa8nRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkWZmEh0ZV+hu84aUWwvq/rPHwWmr5ZjP1zcnYAxZdZQ+pgZdeMSFn1Jg/SofuFPMJiZ0QbxIeW7CJbJ6Bm+AxYFrIwZ+RY6FcUxH9HZzEvrz3DgwJanNRoUssJuVF6fS3knt3RpkgnLbM1cUVjj1hjRvPw8G7YCzFO00sqC0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+C3C9nN; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+C3C9nN"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9df1so547481cf.3
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163959; x=1789768759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=l+C3C9nNxR3sxptQTNyYKzkQu4I6BNivJpM4JuA0aIIeo5FKmwvMmRXsOXOpSWd//I
         sP6kIB97WPQ/nBqR0VXKLwTQEhVlfzv8kXKydLy9q5EI4j2AHKrheItAJpk6NIRI6Rje
         KEf8p8fSsRo6BSqtsvnTtCcTuSM/4/uJGxAGv4PtiRWwP6j0NYED1sksZXzlYp6zGhHU
         wMiA0o6p0559dTQcIksPjxNvodldNi7rUhfhmcReOkytxNvLCDDLMXyTH+CRpZc77bj1
         5NH9GMZs6I+y1HOm+PZMvWD+F+wf+t9OUtmgP+5H2zLWuntMvUSUeEF0gFmr6MvMFC23
         CZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163959; x=1789768759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=ooeVOph1E3ClDu0qtRGBVMijAgETlTvUOxtppkBdAaCRTtKBEc2P+SNZYAtTC/bnqd
         CGfXDFVhzhcavHVStXLuz4kXI4Mrwba79hc5rT1VBRHWUgnF0FOLwrwCuRGniRbAdz+S
         F+bOR5By+EpaNeVV6kxVBNQOCwVWfAoXGTd9jH8hiZwN7uNaP2VSwBDHKgp+nB7ZDAzB
         94iFttADqgxO0mc+GqDsXjicGPaeB/WunTpyfRcJoXg3B5yi+yCOfY1ZBnpd9LlZdbEO
         JliXiDX+ffIeMwBVEWBn5r4Ht8GnjtyVSjrTrmsKM3jf3YSkRJDUSVQ1WpjXWR0cpEM8
         xvpg==
X-Gm-Message-State: AFuF++nfd9U1rioFnmWR3I0JojSRHrc5GugAu1Kc5up5hy6u4071AYsj
	b2II+qXJy/lb8k2SeCJNT7IxOsDe5WOK/yqV6nsj6fJzcBeeeEYHEfrCU4dS4Q==
X-Gm-Gg: AYBFou32ok+QvX7jaIpuNrz/ODMbZI/ittkNvDA1uNJQV25fASHD+f+hnxwi5QUixAO
	0NEJVfGjz82VKjijrP4KWCMFxvi2+RFwLqdxj+cPZe/QhMwrAHfocxFVY57dDPZ/P/zGK5+CmKk
	E0bo/FQPFLjxIVL4v+iJzZmq7DsxNUtArZmis0t8eE/NGqo55pG+Ti5navH9XYydow5HifA7x94
	xaH/vYJBy4bHDu5LGD1guExBES6zhFK6wX3RkKhJeRXr48n0hEMt3sHTPPukrs6TYa9lrjdek5/
	ptRHkDfceo2PM1XsN/Q1v9hZGT4AOVV2jhlOTXOdk1wDZh1Mp7uyaejnod43Vq4otsInp+QuDCH
	VugoXnyIecy+nEY6FXrYpwk9etpsAF2oaQrYVkzvDXd/9qz49ejieO1AFNhCRZN7XZ0anLLezz0
	c8DSnWSdkNfTOpNrJJa2+fIk8n655NWs1zmiN4py0MjaMmxFfOhaPHrWX3P4Uf0jPGnRmXOMhmN
	diCeJDxesYWLh5zFXW8olNofu3SUQ6Qk4bYfdw7Kp2zCx5dQ8xkosdDqbyRiWtCwLMbfPxgO1XW
	lib5rot5wgPUfuEOAu4ROeE8IdSd9SzkLfj84oWN4GHvne3tvw7GdA+fE3o=
X-Received: by 2002:a05:622a:4814:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-530e7edb01emr1223561cf.21.1789163959026;
        Fri, 11 Sep 2026 14:59:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530e64da059sm2568531cf.24.2026.09.11.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:59:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: make gen_bd init helpers static
Date: Fri, 11 Sep 2026 14:59:14 -0700
Message-ID: <20260911215914.175851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.  The reset and release variants stay exported because
sound/soc/fsl/mpc5200_dma.c calls them from a separate module.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/gen_bd.c       | 6 ++----
 include/linux/fsl/bestcomm/gen_bd.h | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..b5093f7445cb 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
 /* Task support code                                                        */
 /* ======================================================================== */
 
-struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr, int maxbufsize)
 {
@@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
 
 int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk)
@@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
 EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
 
 
-extern struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr)
 {
@@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
 
 int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk)
diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
index aeb312a1cd00..7253d308d77a 100644
--- a/include/linux/fsl/bestcomm/gen_bd.h
+++ b/include/linux/fsl/bestcomm/gen_bd.h
@@ -16,10 +16,6 @@ struct bcom_gen_bd {
 };
 
 
-extern struct bcom_task *
-bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr, int maxbufsize);
-
 extern int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk);
 
@@ -27,10 +23,6 @@ extern void
 bcom_gen_bd_rx_release(struct bcom_task *tsk);
 
 
-extern struct bcom_task *
-bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr);
-
 extern int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk);
 
-- 
2.55.0

