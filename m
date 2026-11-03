Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694708;
	b=0BjMMC6ruJ8EtFJpdK7TJ0pEcegdzgqv2jt5Zg3Ni5vT7+7ffN29aHPZchAElfADZ2/M
	 08ZGuyEKjsd4lEXCzpD38qkD2tgZH4VkzFp3auXowMlExTOI6tTlOIMZbcsyvFtwVLSCR
	 PQfMbV2RVmqKcfjhV63M26K+n9oVyVUxHTQ+EWg0D0htjO/iWhaqgJNU9S588eu8ZB+K2
	 1fdPmZaIN/Ebj/g+PcsIY8eMFcVnjFcitQZJwcY0EGEDmF4X1HTfKs6rQcstOTGdLOtMB
	 IIyilce81/Cvhj81/HaeGBp8BrB8gpWrmNQXGpYZpF8FHhMatUyv/m0VnhvqcHQwi3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
	b=ey6fWFwyt0lGOT56w/Whacm2nDwzYsgL/yO55NrmHUh7BQiWzI+cq51MGKlvVI535Box
	 3Vnp0i6FvTkAGwdGmsNEBIRq3h1tdHKChcEN6Vhk4knxKwMCg/d1n0Q9322g+9z6mN2X+
	 /X8vSUOZ4JyVSi2cpdsycWFvmF7/JwVDKZFR8msJbHo0EQSOyCtEX6qqKIeevI8PjZFTr
	 LEyWRz0xwwEEB8BCFmSzkWrMizaY9eDtlMILBuf7Zdja1qnl7WlzpFCsvS0E+JvzHktYo
	 TeUOcw8K5l/OzgUus9SbpeFrSE8iI+PUp8ndhPi428HrjuuV/JG60ZvFTuelvuPolJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfUdxwYN;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A9606D803
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F0A9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfUdxwYN
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2305783a12.3
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694707; x=1794299507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=xfUdxwYNKGjD2g28eddiSzEKICa2ahzEW9vNZclxKOOZpowgclUhu7O09ttE45eeWv
         UzdXEyNdsbSaMK1JoQSMkKIWzuYyV00MUc5kegysab2rwaQKrYw7ct3NaligpOIDNF6E
         1Yj7/HKyfuy/PaRZ3KSNXz5tJYM6gRWCOplw6ew6Yvxvc6lVAzaCrZwPyZkNBROCcAJc
         dqUDA2KRFjlL/xV1vTQtBiYn6AcHTxosKbZXGadeHU/16oox9+Zuo5y5YogBOdGAlT4O
         h4ZQFxwws008hZyxxfXEhXZAbuKuztoce27ZRrLSjo8y4rA9JpQpOcnYIxd/0cWwZTaP
         mvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694707; x=1794299507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=WO6EDoIXpWc6n++ot9BJD3ztuLkUJFfI7sR9b0+TChJOZX4HIuwC3D4XcRFnnEv1CO
         +bERl1R+aYwKXGumk8iR+JsGrLDtsz3XPcxePb83cY/m3uBY18GBSSTNrv8C1LFWO0hC
         wJqKycP1jZoqv402bsBXCNkPloePZ+6I9TcShnxihJcpOh4amxu7Ui6l5RiJD/AcbAz7
         eutjSCpNjh3UMT+gr+M+7X31fdjVwTZSz2PJuLyq7xxPTq9NmxqbCQj0NooXCXP9U0C1
         sSbyDV5ZdOwcMCf3Ka1gPv1QFiukQTwZXVbkGUfGMgKbjvMD5MPY1AM/iM22+BklMdex
         VhuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkfuj2OyB91eFbIEYJKLJv26SXAc6/ByXyIa4JLVFUea/zbGwYeZ+aV3IuEXrucyfXBO/dKv2RhjQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4/f7Et/WL5jC8jpusC0ET+i1+rWuH0OvjsVgf9LBBVDgdHVNH
	dcaKdO+nzBId7qo4oOqzB0DL7HqmS0Bc8YKvrRUuPHqiSHsnNcDqZ45y
X-Gm-Gg: AYBFou14EXM3DvD7kZwWNlfWQjeFgpWdia0VERph+x7AnISCugvCxOEdrSjf4wKGYgI
	VUSSkKTX+k19BEtOe/NrI2YmV3EwTzGtpqYwiIYzKtuhmNf/mMUIcNZ0dMKTk/yO7RJn/6GkSD9
	V8z+LHUVVsMVf0DVnBimz65x2K9CSg2Di1i33xpRuT91xGhfXxswnMcNDNoQsq0nVpKHbJUzDJe
	UtcgGX6YL92ApWa1DPwU94MQCSEkHhagyNayEVsbgDB0eMrj7D1lcCJXPeb6bSfplZCvGWO71Er
	hLFZ1M5xPUI3K8iB3Xy59xyFCAX4SY6gyz8xUcOfHgd4zeGQ/R4IXq964KpaSnSDzDt3EIuvft+
	xxSH63V/XQroDCNBcI1Sr+6AQqcuhU0lZSd1nAcXwA1EgDDh9iqwwGmmMbOhw/gUqCG9HlGKNZb
	+Kn0IE3UwXFh4aO12DMnXptCJnnCWgKqX1FkGKZaMk5jd+98AvqZXPAN9PE6L/8+RxCxhq1pYt2
	0dKnGW4ZsWeEH/kq7w8hdpfCG841XWv4S1fdkJYuncWSH8RnaraoWQMfK40SUvkzJnaiFQ8gvu4
	Mo0pedT5CO5uu68Dcd84wJXzgg0k2Js80vIJpeOhlOePXuu+
X-Received: by 2002:a17:90b:3b44:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ae8983b590mr10535007a91.44.1793694706586;
        Tue, 03 Nov 2026 00:31:46 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5adc33sm3256364a91.1.2026.11.03.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:31:45 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: xilinx: dpdma: fix crash on zero-length cyclic transfer
Date: Tue,  3 Nov 2026 16:31:32 +0800
Message-Id: <20261103083132.1122990-1-lixicaicai@gmail.com>
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

When buf_len is zero, the descriptor build loop never runs, leaving the
descriptor list empty. The following list_first_entry() on the empty list
returns a bad pointer and causes a kernel oops.

Return NULL if the descriptor list is empty after the loop.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065900.3455414-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4..bdfa85b80 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
 		last = sw_desc;
 	}
 
+	if (list_empty(&tx_desc->descriptors))
+		goto error;
+
 	sw_desc = list_first_entry(&tx_desc->descriptors,
 				   struct xilinx_dpdma_sw_desc, node);
 	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
-- 
2.30.2
