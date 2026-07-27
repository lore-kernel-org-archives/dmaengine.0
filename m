Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018542CAE4
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184348; cv=none; b=kVyNnG4WyW9eBUMznR0FD2oxqxmsgdoYwu19roItrIR8LnnxK/m26CfPKoQ7tS8f6xl00PugX3mAFNr3rYZ9iSiYcjKE8zZwiI1aHs89Y9WTXOFlHvUIQQiLeJuNOzIiuGXv3rhcpWHJvU6V/1GUZp5YGP32JEj9iqaXXeqLBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184348; c=relaxed/simple;
	bh=3AFsxk6pXWlCa2eNBzYCCoIPYLy5aDx89x5FzLmEQSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUYT8VTrQEs1FvfMQJjulO3d8ffiHR2vi0GfqIxhkN/BbTsapUAwHYQlk8A6K1FR16BtYUb783HRad3PkYnx3uovVb6416IuOtpKLVp1rTLLWIiwV6mP0iMGCBoHFUJN2a4NiXVJgwb3v7gnY1RciAkGxmlIu30QcxR6hB7pAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDypnq9Y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDypnq9Y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so4083435ad.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184346; x=1785789146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQhmr0nJ4FYcFxbYZ6TeBxNTTLZMEraFxqtg2lSum+k=;
        b=VDypnq9Y45SnO++1YL8eV8PX+4gxququ0KnYt+ZInQztyPZAcrkGT4zY6K1KUN2Zvv
         hzZa2BMZ7OQL7j5DYMv4Dv5yEJQrX7JUn0j/LnriSfbwk1zd20ZLZgVQPW6L8JYt8VqE
         ayXDwSDi6VT8Mp+UQUP8hSKPaa6RvjQi0094G00cE/7VaX4EZEqgxmqQplDXzbl1W6Ne
         ZmXGbwrLqIUtz7QF1bQA9ms1ayr9KgErThJ3yFqdDCZvAWdwq/Z8P0RvybtxXZThjW28
         Gytl2hKea91elVf0RM3wE2FSGFoYrtI0I+4FQdlVI6Uwvgeecr/gQbCPbJQSNwzj+8mH
         f5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184346; x=1785789146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQhmr0nJ4FYcFxbYZ6TeBxNTTLZMEraFxqtg2lSum+k=;
        b=lISVEapdsKVHKV19g1LGUpBJrWy3DdrCoT18GWlVV9bb8k6wE3hXrppAmZPh3RaUY5
         4g4SlLJhigiw/YRcegRuDjJPtp6wVNCUITO6DPXtccStHMcd4HdGvAjg5+8u5KJWcdXL
         c2v4fY9ZNfWrLVDVl388cOMQi0hbVXkYNA8R8VYq/iUdx3gxBGeJPR4diE9xqFiN92nE
         d+WQKBJyt12YsO3deOK/HPbsGWQ3tEWfz0wfRlLHmtNuK3FY/AYIcNyjvEN48eMNNxWX
         Lcl8JSd7NZU9m0nWKTacqQeSf8sWd3QRataMdSrnvdscKZf5iTN2Eqd0N8bpN2S1XuMC
         Fmvw==
X-Forwarded-Encrypted: i=1; AHgh+RrMMN21U/SDt/Xcm/5dafAxDJDCGIIqRyinXE3LE4N1hDg/qinl0HedkB7yzvd/iqndJmugftxWB3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH1rbml6YWRPhlj0uOic7Jrrauv0zHaAVQcllyhhmPFMa2jFm4
	imachgQXrD27PH9Z/1JraW5S+6D+VswFWenIqA319En1c9a9Aca5Ih4I
X-Gm-Gg: AR+sD13oQlZ5jaWCYW9b07oIIlARFa0On1TX1K9PKVBvjmqFDjZpVyBpbgqoETwyYCU
	Vp0Z5rAOUCk5OoD1fWHa4Mb/LKGnSARb4aGKo3HweC1q6ESYAAw7l8ASud6UH5E1u+w3Tn7iq2A
	JmUvD4nnqX/zIwnfSbImGfzPt40VJXerarunfjwXSoaoOp9sDHltOn4pSlyLbJiUV4LEykJ7+6V
	Q0id4GfFQyB6MRyvg4gstNn31SyMPplZSAiV5MecknmxR5NwATGsiO0Pnbd5PqKy8/N8sTnRrTD
	jy4z8uCoiTSJolSA/Sdyj5U/N/zATGjK/C8foY3sU7wDbsycHxsp6p5THlPHMYf+oZ2HiSDPjFy
	/OmFisp+PkRT08fsFXHlmx4x8AZSOf9dhBho9m0Wmk6A6tP5MV02/wctXIHaP2jvQea+BR/GVrG
	WRv1NM
X-Received: by 2002:a17:902:fd8f:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d012086408mr2626055ad.9.1785184346359;
        Mon, 27 Jul 2026 13:32:26 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:25 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 20/64] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Mon, 27 Jul 2026 13:28:48 -0700
Message-ID: <8b19dea06fbd41cc1cd6425c20485614598747fd.1785183549.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..2ec82064fd2e 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dma_chan_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0

