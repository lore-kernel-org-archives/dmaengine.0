Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010002;
	b=AykbmQJSZiOziOfv2tiCeDwSxSuS+rSPkgPG2cfSHgySMSINHZCDqn+5w/8wKTHAHALU
	 3xNJvf0zvDEQBPMXPu0rxc4duBCCxjvroMsx/XwOAMf54W9bQP4wbKV5ECXCRRM/DiwXR
	 B1xzbaJKRo4MX1THfuFauNj1q58EmnsBBqHPrWhBOPxw60plbP6X+RWSsLkgzMNynzi/C
	 QqVraxinA5A/A//iMq4J41x25qLVtixJAVkhllv8B4t3tj0PztzUMqKeRlwKgDJzOwNQt
	 XpiEGrm1AmY6fFqd4sLB6U0UqFUAUKWpML8qrsMxj8v/DJtxOMpXe2CiPHy6ILnHINw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010002;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=0fIls7xgBYMuVb/GHDwECcp79VL7rS3z+yOUUSZgPY9t+7ZVrqBZTkt/2CDRhHLTIocf
	 RFcVZ7Mhjpz0hw9H2GC5DW0LOBLKGc7QWSvu68Kf1u29MRAfT2Eyg/biyIFAWDijVWm3T
	 ntKHAzBG6/rvZNMCWStmzX3MyOjVipbNdlZAYTGR6e1GjTFcZk6e1l2b2zZOzVukLpIVH
	 kAEkejtZtU6YYLakfhjuGk/S4w3MUgw4EJjA0a0aAHXnY09CYXrrzQo7TC10EU27THbXl
	 wHEuYQ3U8BJB1QRzIA+dRWy0+8woH8EXkEyi28HbxcFNSt/xUDiYLx5ZDq131EtXVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28624606A32D
	for <dmaengine@vger.kernel.org>; Sat,  7 Nov 2026 00:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28624606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=blHW9Stq;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=g3DbI5C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
	b=blHW9Stq16HlAMW+Vr+8IoDMnu52jDSd2rEOgXK9puAM4vY1kvrUpGmPiMIn87/ruDmznp
	hgQ/enWjtHj7lkF7QAUROy9j3ELAcwmrF9FAjQCRWwBaua7VFfoudEaeEWnyj50HkRMUxm
	poCuvRfRON9asuFtdnmNJxF0//2u+xE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-BC7SCAOCNyiScTW1tADd1g-1; Fri, 06 Nov 2026 19:06:39 -0500
X-MC-Unique: BC7SCAOCNyiScTW1tADd1g-1
X-Mimecast-MFC-AGG-ID: BC7SCAOCNyiScTW1tADd1g_1794009999
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so396409885a.3
        for <dmaengine@vger.kernel.org>; Fri, 06 Nov 2026 16:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794009999; x=1794614799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=g3DbI5C8Sh5jcyfqakITrZg6V+R8EqZ5c4PJgRcJUNWVtvvYNAPU+9F48wUwE0u/pl
         qxuEmJmn/PB1MiIyyMKLY3iEi/aJ+nQKn2OyRuTr/pjnAcJ5vbcTm9FQaGBghh4mmpUY
         TFXFRHJBN/yxLdRYbDfB4v99hummaGeIx09R9dMoMXTQL6WbrsmswpbWpd7vMb8Y+j7P
         xkP/DNt12faKBXW+LCzmkbmqThBH6yq8WzNOaiL/L+6EXG628GWS8A8bRGDcl7xvbSHC
         G47RTK8+FsWYD15x0kNRuXJoVZ1KwHRJQN3NUdlIDR7UpZ/o1hJIuAjtrbI8UT7I1ud5
         Th7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009999; x=1794614799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgUlYm807ROoByleEtNqO6HkY1e2yjPbq5r68jDHbbY=;
        b=nrySuKsacaAjjLZz1hfdTALdaDGvZOAJyEwnNWIjnxVJxjuuQ9cX3iwz1VWznVKAwA
         r6AbF63f7bDRMVlsR8m9TMhiZT9Lv1XQmp01FLGuvWXQq4kvrOXXeqk6Wx6ginXD0FOB
         K4ENWUTKWc3i0E10tb9vayKkO3V6faPuTQS3GJ6vTA/zHS5+MZYiLEXMFPVr2fyrzWVE
         RemfkVlrh02Crx75DLAPGEp+wXw5iRU+WbophVjK6euPJOKU/ysPxnSpXShNiar6gpNL
         TR974cyZlMcpa/PWad7DX1cgrDvftosble3NVvyFyXXPCRMVG+mm9xcwJR6edIvCZFfP
         mDHg==
X-Forwarded-Encrypted: i=1; AKwUvByE+8wzCgBtvyLJsh9x6pEp2G09n27D7Pig7gu6yXBvHwfjZkOKc7Ad4CWRK9Yk+1s0zRyflpGjg9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tJKgBX78XHhbWiE/feQB1MOXFSaU0UTkcnjjSKdl/kmpBqBEH
	wzJbnMQSf+QwSdsmCfE8mFiM1yP4fiv8mVuocNMlbkiXOSaawbqSvPMymm89WMAyE6TlvOhmGxo
	68+bBmR4ae7MADSu/WFsfo0/SvIaiCqZSqaC+vmnKBKbLya1U+5V0OK7YSC90aA==
X-Gm-Gg: AYBFou28SlSemZ2cU+Lu/kfAoRvdKn9pmPy+1EjTa9j4VDEoxB47i7MmTqXETc7r5uJ
	kiYXF+24f8vCOpcLcAGApR6qmhKZLbHCb+263BnwIld0hAOrKGZP1vgkNmUy8VWKz4Lc/zXTDrt
	8PAye/lCfnL/VNtSWW/aL1A2Ja/rPK/dgG1lBpNypja53CI3D2jlgffcq+c0plewM1oZasS1ixl
	pthJoupN4Mb5Ab1AEoS9xZfMv2fUhgrmRa6zutD3FcT50rE16ALjTJ0T6R4rIcRRGLmUvNtlNTZ
	rciUnMRzc/naVdky3tqsZoZZqsuol2SAnuRgUMowMp2eAEjXNSxXXCvMFR/EjBfpssJ1F58kgYZ
	6p4+MJ7S3kd2xaI1028HibtDs6LBTCb6jTRmv8mzIXsGRTXosaaPBjV2+Qjzipuj2bwCpNaWmw2
	qHklNiAVLkpEOmv8Xc
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656683385a.76.1794009999307;
        Fri, 06 Nov 2026 16:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4487:b0:93e:c12c:fbbf with SMTP id af79cd13be357-945f36131dfmr656679385a.76.1794009998935;
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acc4a7sm31624376d6.44.2026.11.06.16.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:06:38 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] dmaengine: convert to subsys_platform_driver() and
 subsys_platform_driver_probe()
Date: Fri, 06 Nov 2026 19:06:07 -0500
Message-Id: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auEWRvItDaCVxEXMZnEEYySaYsl5
 O5Gu/zgvb+CUGESOKsKhVYWfuUOPCjwd5cTaQ7dMJjBIppJh6ejnDiTluUmm2gM/oQWRxPxCP3
 2LhT5809errv78kF+/nWgtS91cMYmdAAAAA==
X-Change-ID: 20261105-dmaengine-subsys-1dc716130f14
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Zhang Wei <zw@zh-kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-actions@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oVVsVvvwfxfCApVHL620mY2qW7PKDgCvH3JDOSlJNIU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeZdcF1fMUmH+rXipql15WdnT/1AeSXHt/1r/5ue1r9
 M+H33PedJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR/hkM/8zit2odZXRSqNV5
 sVO+W9Z/z9Uvm+4UuU33k+g7uHdzqgojQ8N5ObsWa4OmxOCDrNu7b3qnL/RZuSGFoz3q0Oawy6H
 sjAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macros subsys_platform_driver() and subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      dmaengine: convert to subsys_platform_driver()
      dmaengine: convert to subsys_platform_driver_probe()
      dmaengine: fsldma: convert to subsys_platform_driver()

 drivers/dma/at_xdmac.c          | 12 +-----------
 drivers/dma/bestcomm/bestcomm.c | 18 +-----------------
 drivers/dma/dma-jz4780.c        | 12 +-----------
 drivers/dma/dw/platform.c       | 12 +-----------
 drivers/dma/fsl-edma-main.c     | 12 +-----------
 drivers/dma/fsldma.c            | 14 +-------------
 drivers/dma/imx-dma.c           |  6 +-----
 drivers/dma/mcf-edma-main.c     | 12 +-----------
 drivers/dma/moxart-dma.c        | 12 +-----------
 drivers/dma/owl-dma.c           | 12 +-----------
 drivers/dma/sa11x0-dma.c        | 12 +-----------
 drivers/dma/sf-pdma/sf-pdma.c   | 14 +-------------
 drivers/dma/ste_dma40.c         |  6 +-----
 drivers/dma/ti/omap-dma.c       | 12 +-----------
 14 files changed, 14 insertions(+), 152 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-dmaengine-subsys-1dc716130f14

Best regards,
--  
Brian Masney <bmasney@redhat.com>

