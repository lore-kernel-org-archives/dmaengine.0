Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751371;
	b=NhoqQMDGRRTINx0oua3LZy2hIKkuJUi+0F+O9TOScgtjOVc8F9duOO9x9rJZj0KDgGSu
	 FMAjNTbiG+OR8c/BqAxD7cbnr4PnMEkXNOXxnVYasJXeoXAO1fRP90POTB/Zo8Sbk/gz8
	 EjNUxy923vjWnoxkZbam0pVtc/RsIxOnMSpO4yKVi0CEGUSGczits3kBcbUFWOm1LIvU1
	 9ukdHVvwhc78bVM6C3Eo4y0k+rVJm6uLjS+rddgK+B28flWSiue1EiWs/XXeVo5dr1QK6
	 w4UZ34r6TBiB8Z6NdFbNvbI5Mgo4EJ+pRB0sprYmriHtfl5i9mNSf2AiFCORfHUiVnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751371;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=L8xLGYVH3k+8EgRXZyKrd8PgBYSTsjRfbQ37kLtIgTY=;
	b=ODDd6T4JMgUqOcA+y6LQDJKapdUucclpb9FjN0joWMx9mcIhfoUl7CUj7py5uQtFo1uM
	 XNe04qRwLksFpQyzhHaktovF2L/6qST13AIjPGr2ey/2Mk+rN4huwFSYSvnciThajPpwF
	 0WI9pVPVTdPOuHGlYkfxxFjA+p4Wekibf7CqY/cwopY9gJb6oXL/LB9JEQT0UypyveDa5
	 WqkSpjLeXm9LvPaQk7baF94XxbYCFLqrkY8p3MNU4LOEI1elyz0NPsXyFeyDNVTg0e7Ib
	 JhNH/F9D5FMCUQ5ej6xRS9uNLeSQ17W3OoV8rlTSl/GcTWr62zKwBG5QsPL1/GnL0IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=r1viSbAv;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=w2HwxNQ6;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCEF60A383F;
	Sun, 15 Nov 2026 14:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCEF60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=r1viSbAv;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=w2HwxNQ6
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1794751364; bh=L8xLGYVH3k+8EgRXZyKrd8P
	gBYSTsjRfbQ37kLtIgTY=; b=r1viSbAvO/rDEcOLpZdwQE34QgwFyvH7Nb9m6CWi4EEO5Sf6CG
	cjf/6PdAtUAoT2zileX5U5OBfXmlCtZGa4qRH5juFK5whCeptYS8SL2UJ+3RjFofdw0QJ8uWptH
	FWoFsZF1FXrzOZnfMqKsYJSYHiFEc6B+fMEEEXdw1fFHtpN4qhjJKBgZ9zBToiCosKOJi/uSPJZ
	pIFF7gKFj+jAut2okgDT7hqMkxAg7rcH9Viy8tiQDri09jHnY0b4CyLh4qVBS8fgjg5b1Iwp5iN
	Wzb628eT4Kdk1TPFndw8J3ntBREQIp7qYUAGqZjIPkoJuMCcqaMG1VpX6viJy6MQUpg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1794751364; bh=L8xLGYVH3k+8EgRXZyKrd8P
	gBYSTsjRfbQ37kLtIgTY=; b=w2HwxNQ6MLt8/Hk3gjZhpMahwsQPHbr4CiLejeu28/2L5f9FN/
	TXqbV6rwADQveOcjrN9/Hc9ywEQD3QToKuDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/3] dmaengine: Add support for immediate commands
Date: Sun, 15 Nov 2026 17:02:42 +0300
Message-Id: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBcwFVfYq4wdahpnBtGtVRHEd
 7fbjt/h/3fIklQy3KodkqyadRoL6FIBD2F8CmosBle7KxG1+OHJsAuG0QKqmUQNs2DrPTUNe89
 OoMTvJL1uv/H98Xdeupfw/L3BcZwMsuNVegAAAA==
X-Change-ID: 20261115-qcom-bam-dma-immediate-577133c77c2e
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Sireesh Kodali <sireeshkodali1@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794751364; l=1978;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=KLb0ocTbeYFA6ePesTNKBcDGe/DlIQdK1DaNB180ZCE=;
 b=glRsAbWZXw/lsfW93DEFHf7mJLXlH31PaDWDkbfyisRbJS9UuzdsCITKefipzGo7yP7xfT0TJ
 ycbJfw2QJk6Au/ekNmLZ/MD2Vc7Ypw/Yzxtu769rvCICxFsmqObdSku
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

The IPA v2.x block, found on some older Qualcomm SoCs, uses BAM DMA to
send and receive packets from the AP. It also uses BAM to receive
commands from the AP (and possibly the modem). These commands are
encoded as "Immediate Commands". 

Immediate (IMM) (only for BAM-NDP): Allows the software to create
descriptors of type immediate, which does not generate any data
transmissions or registers configuration, it is simply supplied to the
peripheral, the peripheral then parses its fields (which are
irrelevant to the BAM). Only the flags of this descriptor are relevant
to the BAM, address and size are irrelevant, and BAM simply passes
them as is to the peripheral. This can be used for the software to
operate peripheral-specific operations within regular data operations.
Immediate descriptors are published on the sidebands as 1 byte size
descriptor, once BAM_NDP fetches an immediate descriptor, it publishes
all recently fetched descriptors including the immediate descriptor
with immediate indication, to inform the peripheral that the last
published descriptor was immediate descriptor.

Adding support for immediate commands is trivial, but requires 
also adding Immediate Commands to the dmaengine API, which is 
what this patch series does.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Sireesh Kodali (3):
      doc: dmaengine: client-api: Add immediate commands in the DMA client API
      dmaengine: Add support for immediate commands in the client API
      dmaengine: bam_dma: Add support for immediate commands

 Documentation/driver-api/dmaengine/provider.rst | 10 ++++++++++
 drivers/dma/qcom/bam_dma.c                      |  3 +++
 include/linux/dmaengine.h                       |  4 ++++
 3 files changed, 17 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261115-qcom-bam-dma-immediate-577133c77c2e

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>
