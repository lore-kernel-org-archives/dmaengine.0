Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733612;
	b=RFUW9nFwp1J+wCO3/2LhjgvG2ZX5xEDP+zp8hxTROTYHeUikk8tC7R9UH7iXx7zqDC8W
	 mfOgFYxQbt2WrRsUWMdggvIu0qwcIvsc70OqHN2SA3DtEKhgdEKdcwIaOSQrERvaWqq3z
	 KePHNy4k1IFLIVJtM7yqMoygzM1vOmbE9z7Nm4fKOu/Vu5suCkg55zwA7CbDfDdYmtHhT
	 uFlPY8mNucFLhBpPoyXqFD0kvKrXKwaM+24gWEVxXjmVLoRQgn7TViZSgU/kTz+vB1ZG7
	 BQsfc6qhqyyPY0wsih/SphKZGwmGMxFRb3qJPhhfVsietAN+necgB4MNXhfVeBD99NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
	b=Llc6TGYyJLEOxaT8Oc6KIlvp/OyMNX+obNZV0M+V61CLoKxI8jQ4f+UdErdLklyYgEhd
	 MSSOVatCLewI/BrX630QvarjgjTUCOvkJIAgK0/S4U29t5LxdKpwj3C4lwHfZ/VjLtvhY
	 T4V6Z/6Vdf8tnqgm358KtvO78X9HSevN+6fPVLz+tazAlymv5Geemab4g1Ywzj23i0f85
	 tTzlWt0yuCR1/tLdKjeZfceNRbi9pOm0VYmPBIE6ydHQq7KGKCSfgX5Z8XPLUAxDzXmV4
	 cDgitYXecOYFEAYjfODRFqyjwFJmTkg62SM/vpQ9sIq2rYk7oCAYLNru3Zh7sQIo8Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deXdu4vE;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB5606A31D
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEB5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=deXdu4vE
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862b3938d98so261970a34.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733610; x=1795338410; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=deXdu4vE2gFpVY9tLWfLiHyE9S1H8z+CgAhCp/wol9OPeJkKn8+i9P4jU38oHZdFwT
         ysFDChqKrOkNDUpKOwf5TM6fMwLj0e0WpIFFg0uwxEqvRh/gaZRl3Cxrmi1vGC+MINvE
         4z7HM76seU/xEClTBdehoj3B1h4HU9WqQcWiqNhe+ennCSOQTnQjyy9nVrKTIISvTAPx
         OvWfQ9+2ZGdhgsEJvK9YUD7RfQJFb2cs1lcQdQGfLZyEgGq+c0/r3O4V7LZUwSMWy7pb
         oJL6MQXYsjFvvL8N/1nK8tojwTWBfQSUGEBOOtvWziqB8/aRa1HEqpp3nM6tDJa6Yyk/
         l84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733610; x=1795338410;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EICA2+Ii2qgfcuNngaTE7AGwJ5yMZFSeIndPaowbVuc=;
        b=LdV1cgv18QyELtn+SRZR/ryIJGVnyIkrPXIgdhTO0yK3PnsAQn2tmvvR+et7g3McWz
         dX7615+0PEcaN5j3pQgiVC5XnnZKjxlDRCnAVKfU1PUkofblb25hPuNgYW9+LJFNqCjl
         8otJUWbOxyo8jwfCK7Ul6pt45ZYYEB7qqKTCOn7L5c644pJHpRAiPuMF/HS/j2v7AwX5
         K5GizXqlBCFXiJNUNIduc8B6S1WTMNVh0u9Ws3FHCHZ/Hr4zI9KaDSx+jpAVCyXF97Ec
         q/yg2a6W6f5YeY6sOa0+6LzzXgzLTzggvmQglkffsBLf+JCGujWgNjDmXNGY7B9ISUWs
         57FQ==
X-Gm-Message-State: APuU4Z+ljbrU34XS0oS1QV5OtPO56zksNgjAh+R71VGebOgDfI7iVe70
	rh+SIAaMtDeOn5JHDwJtz1bIijbtSgh70tBxTsqAOAZGEKC8MerqK0do
X-Gm-Gg: AYBFou3mEZKC2NO/uTwBEwuyWSFHFpHEXXumPQTgV8w6ZSkwxhqPRqDMucgMjDINdGP
	Gcc+CZe75pPEjbzBXeSVJSQwHS4cPGFGhd/8dX9/+v/b8u2q3ABQl8CIwFLwBC4YXQypS83e9if
	COIUgx4e5aEhgFX8egXnORQEXjVm8NRdGdu5PLQExOpRKCJP4erZhkWPPAKv/l0/j/zK/Ye74A7
	qdPXXsgQ9wyKuckQYmsbwZeH7TEmRc1A8BIWECvJnIuBG8IWLx6ciuqXvfyvWDDWqGkldqUxesQ
	XFUljYyBvj5qcOlNZ/duK9yMrbHOQSNyLBPEldtVdDmQucsLwhIwgEUGrheJkJJvbv+0p6Wfd+Q
	cqeQZ2VY0G9I7RFvSOL4qsjTBMle7tuhhZ7Svsargj/w3sn8zqoV/mqHKqocPIPU9c4DB7m8pyB
	Zunj7uwPCL3SM4J+KmZObTf+P/2hPRt2NSHnd7yWCrVPI2oZfi7kjSo/EACfe1dkzjRifByQ8RZ
	WeTKSp09ybiuCmhgH2KkRWlbRPpQd4sh/PLGJNWbSkE9olZrMAZGztD3OlGqOT+X0ElB8ZcPQJs
	11YzyVb8kH0tiAc3kWgBp8gJkkjp50AnI2YosP+UrbwN1BsIn4KbIaWjiquwBcHh17KiQEpF9H2
	i2YaEuccME7IfytbRYRl/Tjf++OnrnccGmWb41M0Lg4/ObmcDnKMNu4j6bDDhMWhpBIsQCLcDuY
	IV3dfQjCcm75yH8xxVnIf/9TEHik2TdhTicRymaxyP+DKyDCc29Kfy
X-Received: by 2002:a05:6820:2d8a:b0:71a:e62f:62ee with SMTP id 006d021491bc7-71ae62f6ac9mr968000eaf.23.1794733610517;
        Sun, 15 Nov 2026 01:06:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Sun, 15 Nov 2026 02:06:33 -0700
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr0K6dkxboEZX3sOwaMsURimYthIN4
 e4WPIHJJD8v+Xl/FhYxEEZ2KRYWcKZI05hBHgpmez12CNRmZpJLJQQvIb6Mp5RjrAhar8HqYTD
 aPmAgh4k8wizAKHGWXHFzUo5l1zOgo/e+c2t+nEV3tGmTb42eYprCZ39kFlvv3818Aipba67qU
 vDKXTuvaTjaybNmXdcv6o9WGuwAAAA=
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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
 drivers/dma/virt-dma.h  | 20 ++++++++++++++-
 2 files changed, 59 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

