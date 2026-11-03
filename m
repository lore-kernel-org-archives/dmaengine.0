Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734689;
	b=djjT3XSoy3frFhikwOhT0WJL5R7Wm0CK7VBumpBpCRHGMlzSopD2pGEkftu4EYYAKG3N
	 nHrcQO9Z6k+Ha44AqEOtNdUeAie2a1BUTVUr+2CqS2eUZ2vTI9eNAON6GcwMghpE9mzZ6
	 7RwSgF7PvPpr4UzByjZ8ukc6GO96VKzoHZUmhxexWhexgxM71Cz2zbGvhn7hJoil+erpx
	 HEs0CViCCaoxqwvym6+JyOQ4y0hoQB+aQv+Q7sRfkU2VJQxzx3Y15WbvE+/FqL0Lpnafy
	 MG4HtVHMkqtY3yiugBWA/1lLA8H35osBNlCO9gDfNgqclItODtnz6jLwLwMXEyA51Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
	b=yOfOmoBD6uKWsvbqxCpBdk9Mf7red7ZopgQ3hG4xfAwiDuqzotUmL+fl5MtVzVNCJuDe
	 bDnJojcZm67JS8ndroDbifQUEIwEUCItBejEePoOIZNbx+5lTxefCCnyj0dFqTJivMtMF
	 GNrmiF2M0Ors5smNcoeYTNkvXB8G8BGQWtGncd3f1CS3HLM+8Vpxw26l8QohzeWgLdY9D
	 2haiyjuhafpEDRSeb9IX6a0WCg6N2C3+DujCEcoWoq/7EnGf2gkDYQDVwkuSvuKIgmzba
	 eNTiUEed+yopmo7BfdOxRSXGM4F7uz6QogmgDfv5srdQ9PyRQxAtoKVHG3ch2LceEeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qc9ryKR0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B33606A328
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 19:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B33606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Qc9ryKR0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso29480605e9.0
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793734686; x=1794339486; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
        b=Qc9ryKR0MLQPExVVbk5Z+7VV9yjXBcNjJcjTBDe3G38pocoOV82H9z+NwxbazjH1aK
         E/6qBcrQiYCO92zbzb4A3jxte1kO2Y76s7HST3qICTyk1VTMVBeNMx5VvQpK66t/CCE+
         UQKnJaVxg1p9CgO4NrTqUSqpyMV9vVBe2liobRwchiMWD4mZpOH3D/L2UVWey1DMutaB
         8MLFfwEv+rLDXPodVfLmOs/EOzGv+9EGOUvnmBnfE49ks2lpRU4l49QdPz2KWLl5EjVv
         tqt0/vY/YM+R0YCCYDsdU/fEw9wmJfNgS9uA9Yt8acfXii/ixED9bdMr+VxZOmmwXMWf
         PGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734686; x=1794339486;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ha3lGnJBwyk4YR7zSIS8QHZCwEJjqdMUCtp8VxcQYlg=;
        b=roHbJtfW78LsDFH+07sisM/ShqTPKSG/JyaQKqKJPAyv/GQ6rh3adVWbmaItmgVqij
         92kzantGweHKJFLVU57xQ56zr9OY3/jaZv8z8DUsewcfT7+Ks3m1+oOfk0mKlEVsKfR/
         AND8uwcdf313DDwn42ukcq+RkwyEVmBhy5gpIq4pELWeJ1JLYEFoz6dYbkXb9HsEX4UD
         mYwNuoAMCANuj+DtQ9HewXnpRHIkR5y1H9KEagazq6Xo9UVyVok5SznDaLzTq1lcQMcf
         +D3q8As2yBYzYcZBT5ytv3TT6VUOfpK3n1vcrD8R1E03mWM701tRcY4HzDgDpfrGcz9H
         FHpQ==
X-Gm-Message-State: APuU4Z+rca27gDNHJbqgv3w5l66EtpjqIvyv6OjFMoToMZMzGbn2ycqH
	5fzyaBMtw0FmFXPMTeTvPHTCyZu/JwRvNDYMw5t7WOBeslkqaB+s09U/6tW7/Krxg14=
X-Gm-Gg: AYBFou2Zmj2DyCOWCt/72APASLJggmqKIx4o/x7eruA9xvu5ponfjeDl04U8Lq+Rea6
	sX7ngDC4KAQlb6BdxefbcZzhjBZXim/pnzOESBOEU+JYHGFC1YxF1rOu4P3I1lMDOaD9RTFwNgQ
	ulv5QHMA/e2HBGkGcIPSr0CxAjeYsjvFh54naVw7auvnMVDviNiUloWMZJpR5vuQpsbTHd/oxRI
	kNisMeFs9gwjXG6/lhgW9imvvJflfP8sWWLhy/DD+sLaA+N7V181qw8tl4vXel3QgNkmHgonLMd
	w0B8acYP9zhgTJy+6ylyU5lKijCWszNfSKg+yWYSnOFB5wGU5yyl1lEo3X3WiXecGVhnVU7z7p1
	rTc0K3iWh7y5dnAuQznEbUy5c0xp7lFfo0HZxYC0zv0q8IQz9+JdNxZ0YfblbIrpPMvtg+Hdwey
	RN2CVhTULp1UvGtGVYQSTSivduf5R9IhUVT37zAXwUO6MhzSUuJoV8j3kh5JviBg8a2b3uamCGn
	ok5sYEU+NSQ0I/Bn4jBOK1DvaVsASRqJiXoDhrY8Bq9c0B0MAe5najz8CTCwEvTugw14wym+hw7
	xMrJSD/ell3RSSYRvd3bBW79Lw==
X-Received: by 2002:a05:600d:82ea:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4ac17ff9be8mr351143745e9.21.1793734686327;
        Tue, 03 Nov 2026 11:38:06 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm114159265e9.13.2026.11.03.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:38:05 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH 0/4] dmaengine: ti: cppi41: Fix suspend/resume issues
Date: Tue, 03 Nov 2026 20:37:27 +0100
Message-Id: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAPc36moC/yXMSw6CMBAA0KuQWTNJPwjIVQiLUkYdIzBpgZAQ7
 k7V5du8AyIFpghNdkCgjSPPU4LOM/AvNz0JeUgGo0yplVW4VWhxmYU9utHa20dG9CJcaOx1rZw
 ZSnOvK0iBBHrw/svb7u+49m/yy3eE87wAcQ9sVX4AAAA=
X-Change-ID: 20261030-v7-3-topic-am335lpm-cppi41-b180a2d62987
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, 
 "Francis, Sebin" <sebin.francis@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=msp@baylibre.com;
 h=from:subject:message-id; bh=SMzMjv+Lw+u1NgOCPW5V9Cq40PADdnkoFK7SsolANoM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqxXFsx3/0ZZ3ZhoK2HEfSHzmxSP1u2nzzY9nLXy2MLTC
 SlW+U8mdJSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBE/h1jZPh4Im/BCfUGZ7GE
 XZPmdVzmDP6552C+7m21Caqv5x85ODGRkaGH0XFV5cplp9SOMTE81yz+4Xi3rbKy3uSJfblqgMe
 FXCYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

there are some issues with cppi41 regarding suspend/resume. This series
fixes suspend/resume when the device is currently runtime suspended. It
also fixes an incomplete restore of QMGR_MEMCTRL during resume. To make
the restore on resume more reliable the last patch unifies the register
writes for init and resume.

I tested this series with am335x-evm

Best,
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI) (4):
      dmaengine: ti: cppi41: Use td_queue to restore DMA_TDFDQ
      dmaengine: ti: cppi41: Fix register access in suspend_late
      dmaengine: ti: cppi41: Restore QMGR_MEMCTRL in resume
      dmaengine: ti: cppi41: Share register setup with resume

 drivers/dma/ti/cppi41.c | 74 ++++++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 31 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-v7-3-topic-am335lpm-cppi41-b180a2d62987

Best regards,
--  
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

