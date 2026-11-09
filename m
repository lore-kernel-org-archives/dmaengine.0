Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200561;
	b=yerP0Tpf+D3cE5NY/2XxuT5EIayJPOa9epzLxYZrOSuGgc4uNrMbIR4mFopKP3dQjFUn
	 +p4OnYQ/Am8H2f0jEV5WKDKYpAUsbaSEAesFLYvbV9/ZW0Ns3n+YrSXqcZ2uSueJKsTxH
	 T00ZSOBnLERXVUfe1OjDzzDHBZnGQpCRIiMs7JIvCprW7pDIp8rsiJufj9I8lOhMLvP4i
	 HAMuffUZrwY7sT2yRKDWW3g54jng/CLnvCWa2RcE9HicpoaX4hVIA5PYJPLUM2C3UFx+b
	 LWDvqsZyisD7CKn5AVbbVXoYS9+R38t3LJvbIcDZMaRKNN2cz2ChTHqgOB3IR8G82Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
	b=l0i0aSEaw/Nk2ALUpFosq/t4hUKKRX1Vt8RMXIMWWzIVMdMli+mwgkzUE3xVaYQ87OWe
	 C1TCdezQqJpqjSIyUZ/py9GDUd+3nzeUrZ+Pyd57FVz7kxSDlsXfCnICS+6F3hZnr5tYb
	 +JWU9Uj4UfIxcV78hzxuHvX49cbc8GbEnVaAf9qrCdhUnN8xP1dtPtAkPL4MLqS4dhjvg
	 zK7AcquSfz5SgMz4kijVyr9hhELZZgyNhvOOlq2mF44cvT2rW/yR0ndPwIMfberW1DiWp
	 nf+kZoqDh+80bOc42HF0xp+DTBg1MG4e80cvnuxz8dR9jSe+0Jtt9Y5UMZ1MnML1FDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeFl0mo+;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB6606A321
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 05:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NeFl0mo+
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-5641f26ce05so158265b6e.2
        for <dmaengine@vger.kernel.org>; Sun, 08 Nov 2026 21:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200559; x=1794805359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
        b=NeFl0mo+kN5LveCEELqE8KYxpHl+jkjeyMtjDNMZKSqtMpdKxX3L0Blep+eF2G3OhO
         DdyaeUGbL1F16FxE9mjuvQlOO5wqBLl9UGKSja35X7oYAynGfWg1greYRpthzM0WidBT
         u3Q8R1iY4H7YKRTd//TbsHZW7VBGLzRYJG1DeksEzcRzEYeSDejBFFRbVoNmDWq3MY28
         piGNKzHc6Q4O//fv+5iQueeC48bpdjGT8f+hLvf4WRKS3CrgYXDN4UK5kPzxIWm8+I0D
         MOqKjeaoMckZcQeJ3l7Ltxr3W9csyk5YlhXjPwAG7HIrqns6jnEqDRFQNT3DOxyByZUw
         a0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200559; x=1794805359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yodLZKxnYV5I2eY1U3dtFzN1Z8iibbm+KfUX4glKyUM=;
        b=AdJWpiyxSHG5ohWklGSscDWDI9nKU2ci//BKpypyNMB1DMvBJK9vtRXMUJCEilBBvL
         vdgSzZGrRicC2fl/nVQnniUgij26Dp69Veyu+vrream+gLCOlLO7bJfE8GTedyVrG9uK
         XA9VIRhFytGS9NdLhxBgda9V1ywArmUyTj74yBj+x8yoX6kZSDv972m64xG+407Efi7r
         rqgf6PHHlAhaHEGfHwtprOE8nwK4ANPIWS1bZJCA8IIcIgrD8JZWfFKR5Wp9z65xSoz2
         p0KnF2mECZW7mTWIGpiJNgqRTYgOQgL7FjX/3ynlmiijFGGxyyA7dxPGrJ6H/SkHLmsm
         4Yyw==
X-Gm-Message-State: APuU4Z8fxrwrqFMPa/4kNbWsWRHzXUW6YyQOdHzNJy3kzwgi16x3Mbqk
	vHT7RimPB1NTyrhPaU2uk4Ej78htRLaUJkb1+fRaEpNEaGWf+qS185WI
X-Gm-Gg: AYBFou1isuNF+V1fx/CP7BLQBrGMawiDO6uo+KzXm6xA0iALtU0Cvolcxmy9xsucDif
	7GpIKFZKaFEVpyH84h6L4bXNXqa/CJu+S3QLQcZogA4/YxF1KG6Ht4F0WqhvtMXuoUsfBu2UESs
	dme9UQRg+b5RtLN86yB/D/XFm7lUsjdLAdk/Nt2JAL1iw4YYs8G1FzGuSLvad7XGKsCfiK45dgy
	fQh3kbQ0mTaz8BjLd+uJrnS4cf5JH1H0cylexGZBTXF22j0+panD3BYkupu8EtuUKol5RjtHbNd
	cEurU2/HbbDnG70SVuzz46u+4s576a4TkWbXPPm3ztwACWvIT1EQK2CuVhku/YhTCzZHTVgYqXv
	JMYnHo2V9YkjAvd7Osd5EqaDNoI+2Hp0WZJqUNZro2dTQsRV6DcamJlegX5VzA2wf5qU56oIaxd
	xkHyQeuTH2j3Dl0WuPClwfAZqHBBuWVPIFXa6TTecCbKtPoiMk8Z28/6+083CS6z/DOsE1KNkSK
	aTOnhvboI11HqF60/x2+40xf7R+/4PKRqWK5j6876BVgwChJtwclNBVl9yCsajhaNI8PYdmq4SA
	mgP3gvQbPtoEyJu0VQbbjN41OR038gcbjEiLhLt4SlUUBTTqptFGzAglM/rlAXwHvDW3hLYhkvh
	dXmT6M2Yz3ShVA7Y46ZGczsgnuqKMfo0Sx5VLhXVm07v2eJ2N/r0SPOKVUZK9CI6MoutXU/fy60
	Vk+ZPyEttGsGxqStUql27RcNwiKh3DXJg8boVNId2flO2kU38M5NhozijHct0hBcKqvmSBnHb1c
	w==
X-Received: by 2002:a05:6808:1686:b0:53a:88c6:96c8 with SMTP id 5614622812f47-568144504a9mr1814998b6e.55.1794200559552;
        Sun, 08 Nov 2026 21:02:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Sun, 08 Nov 2026 22:02:35 -0700
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wqDMBBEf0Xy3KXGQqz9leJDLqtuwRiy0Qriv
 zepj2eYOXMIxkjI4lUdIuJGTIvPIG+VsJP2IwK5zKKpGyVl/QRezUwJ3Bf0TuBmDZyWAEGvjLB
 JsN1jkNiqVqpOZEuIOND+f3j3F2fFB20q2tIwOi9N1N5OJcpK9CN5vF+78/wBHmDM+aUAAAA=
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Use the layout-aware channel enable check during termination and retain
transfer resources when the channel does not stop. Keep suspension status
available until the polling pause path observes it, including when an
acknowledgment arrives after the polling timeout or another channel
interrupts concurrently.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: preserve suspension status until pause observes it

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 34 ++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

