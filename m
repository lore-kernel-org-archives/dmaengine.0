Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111387;
	b=yNL/oEZLjB6l3vHfFG+2uei3w/lX7/+sAT1QBi2rzKr5TfTDoDRM+6ZXrnZcb/Uskj49
	 5ioJdN78PS6YwIVS2rGy869PCCzW/jyQ6tfJR/ZqSxPbNmuoXlC8wBufOndaCwBbr5AqC
	 Fc6EefDPYR530YCTHpycPX4rjNgj7N11JXvvJm5Vb906dLZIXbg05OASJMMOW4uI3Li10
	 GBT4Fw9Vc/iu+cKwtaKFC8fQg1u/+u6sJzU2sabCQkiBSylHZA/h6BIBj5M4PLXUDeC/G
	 Piw09PNd8jReUDTw4cqXgZrWNJDhiWFDm878qwqO6uUs/EOwNGu1Il9/0gR7JDEgDbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
	b=kkk/NZxxDH5WU5HhwkFemjlypIGqhGlpqN5Cj3cQM6ZmpKXakBJOhAsvlCq8dXNAuafK
	 3ZZRHudrUwRLhlJN+x4/cxSo9MkIcVJOEFsfoKo2+vLfxJ0WRZ0BXUV1otLyKsu0/rs55
	 Tf2JejMKz4dM6vH2uUM/BZazYENBmsPRHB+TPTAhuGq5/jGvlreEyCpjzmDDPqScC3Tld
	 jqATFrnyjQ1lhpVrqpYrQZIvokhDbJuMkxLOgRWrNXJ8Y6NJTrLG4tlpyMSS4cuSYmCAi
	 +HPrWaqXoRNBm/2KHzYul6MWRD2DWCCLpVMZFJjuGbcRsbDreyrlV0ztolkPHNc7pTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OT4sxAJ8;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B724606A320
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 18:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B724606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OT4sxAJ8
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f13so19456eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111386; x=1795716186; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=OT4sxAJ8cCpw6tBjaH2XOh6hNOq8oq7Ex4XM/Wpwi4I8aOx67yJbb4tZSaaGbsA3ck
         90HTDt6AxMEdVd2A2W98q37oK2a68Rpa7R5Wl/LVmJaNL6Gz8JM13ZcC8tWwnA1JhGyN
         dIqLQICPft4oxfXfp0KenraWCFMSlTG4EyG7HIDcvd9dgrTlsNUS5O44lsyyOIdVGnEC
         U+naqMSFCm4IlITZQL2snE+3s+YGAp7aVAsYLpxhnH0ceX1jvrmi+JE3zD3OuzavJ2nJ
         aGqzJgdsYeoi3fVH09hw5fozUUJ+EmOsvylygJS5gCHsug+B88UP7iYDmNsEiX1AjnCk
         7oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111386; x=1795716186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=kAOq26YpJuxRWA69xlHSVsakEZHgSE7qlFBy9i1oOSayyGV4nJc90SMXiQUbhtr9VX
         LuPZGkzOaXRk870esP5v+fEn9NQnMwz+aA+iRbsLrEvJDGDM6q7Z0fBGPjxxesLo4LuP
         WtJCCbd+eVlZDlV5OmuVub/xwTaLJOks4BvJXskw2EWp+Mdr+QIRvs8wzejWKbDl/eGV
         Iq9bAW44on7DbgikE3gkF5OYpzQuSgtycJfdqRvzJMntTeB6tlaX3VPlL8Vx3rqrEeps
         ZAbeQqgs46gIr9rVlCRnzIRHwJIB9mBwyOUhsiDLTspOSnzNT8EhY3ifC3kbWjX4ctdN
         r4fg==
X-Gm-Message-State: APuU4Z+QUbHwvhM+8tgJRCgvYBtJpJrZf17XJKTQKmbMOqGF/+1ksmbz
	EtIkZi4y16oiN77wiYXUgr+yLzN66CeNNdWa0KlQo+XbCITRrYwAg/x8
X-Gm-Gg: AYBFou0iwrmo4Besd2sbU1ACQwnqMhqfnRxVYejuZRaocotSPH1p4Yl4+6hhQmbpzJj
	AQpPIg2uVwKXZx6dBZcH8hlrUcSyKbKXYTnb8HrcBBMoQ7eaWZB74abhljsGjGjB8bjrE3TmSf7
	l//iUP4rEFdD5wflgDq97Ss4cfFSk/jmQVDhmP4TYlANoEPSmN+MxSk0FtZcio5dgAjP9I6kdtS
	BFe80g/hp4Z3NF6+phayiy5kvPoENu1sTVAyJdsMLhRkUeQ1+SyLchUuelHqtypR5j3O4zDZlqc
	hw0b090GQ1sGxqBfotRTi1LlpXNcgXk8hC2UHvNAgjU8+XcnGaO38JYfxD19xf9fwnPRWl9ZhJ9
	D4IYKcUfVKqPO8RsSfqLag1VQegkX9RPIjn8fNQkeC0+tNbV6mcg73OEeQ8nCaF0ZsMWlABJUDe
	eJvsgSmpfHDNW3UULeZnbmAlWYZ2JUUhFszwB8m10mv1ScIZ1Svg0ZpAQve6xveT0X+6AeC2YPs
	h4IZ1Q91HnpcDgqJTQYkYxvUbxdnfS/merNfBJtIuEY2IHXASOF85x94sn+FSHb8i0tuyvZS6Mf
	US78VQy7UUtHGbJ+ZMQhucTNY2FZGeQo/0rlHYa3iqyeq/X66vZShynZMadQtvB9EZGHYPSE1sE
	sPd5b0+GBRZVYBpGYKgbaTgTtPOC9SxshOM1op0JWus6l6iGOMag0Go3kOnd0SG7/Pe6tFxhoSo
	/N5Si73T/Sqg8HMkeMxaug9r/Yrrq+iAhfLGxSTXYK9kH57S3RANuLlTPuIc70q/HZPdmguu5PX
	g==
X-Received: by 2002:a05:6820:f006:b0:70d:a53e:845 with SMTP id 006d021491bc7-71b394d5f20mr371062eaf.17.1795111386435;
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Thu, 19 Nov 2026 11:02:20 -0700
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dkxboKAr72FctKWFUQqGYqMh3
 N0WNyw1meTnJz/vzUy8GdF4ctrNZDQBPQ59LNl+R3Qr+8YA1rETTrlgjGbgn8rhFKPPEWonQcu
 uU1LfoUNrJnQGAgMl2JFTQVUpLImsx2gsvlbP5frtEXQzekrwtGjRT8P4Xh8JLO3+dcZjkOtCU
 lFkjOb23DiJ3UEPjiRn4BsqK36lcqBgVVnzoiopt9WWuizLB8ex879CAQAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v3:
- Leave prepared descriptors with the client during termination so they
  can still be submitted after synchronization, following Frank's review:
  https://lore.kernel.org/r/av8mu_ZFxNKSgFTK@SMW015318/
- Link to v2: https://patch.msgid.link/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com

Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 21 ++++++++++++++-
 2 files changed, 60 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

