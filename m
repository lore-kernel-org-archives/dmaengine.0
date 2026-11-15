Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725117;
	b=OnZXnlYYAr7JraA5hMeXsNUiiqXCm/OftmRFaEg8bKpkblJ+UqInBICiLjUG3BSf7Fll
	 NCdug3wd0LjCF6f7gWp0Yhy5p5cDf0AsvyE4GebJ1ISmyhby+IKjT4lz8ZuqYl8iBclsT
	 UUqUFCpWL2r2iAAY8hGlYsEagWXbRU2edUafwCxKO1OJmkWFptiC0FtCa5ycBGlzvMj4+
	 2R3mdZHCqI6YeB4jVUq21AoWUm1/XZdBHOO6zAw0MlD/x3DI8qka2IDXbxrYBoYIICxpm
	 x9Hv2povi9pmwpjFUX0YhmewzcR1j1AyDUxGvyBLMhjr/Mjz8lTaQIluhCNWluaLsHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
	b=BmDJZNelbX2yuwjGS6904C1bCo/O0XgiaPudcxBMNf40mmQLJmtgjcq+eIGR55je8AGz
	 obVvx7+v8mBx/0G+02YwQ/+PC1pkcpgB4ptXolenVrDZdZrOOrtQ2cWIfCW6QRF6b/kiJ
	 YGt5gumsmviz+WW2WMH1h7jU1H2cWZzqHi1Af8BeEOAXmKHKL7ybnUQR2pSIepr9uXu+u
	 RMHE+LX7FIE8QTdSAMlCmDb4qS8AspKq99CW/dqNWvKu34YOXPQfQxvL/yDDQlSi6oouh
	 yzPcFZaEDq6u45oHqSGq9PIuKfttyLAdoK+Y9tCvYih7oICkCr35Uj4AhijDhuFSZkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU+Afu0Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C964606A32F
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 06:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C964606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DU+Afu0Z
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5495d549924so34718821cf.1
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 22:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725116; cv=none;
        d=google.com; s=arc-20260327;
        b=HbGY0fsthbXGMEaZBLrt303uAEkPUuL9SLjr6XcemvJ7OG6ow5b6S5KF+96azDk4a1
         iRfSz3Adsn+37nCGhyy6XUB5uwlMu/HPWo30IrwdFOuBvxg4G23MzpNU2T2x690ghh/H
         7bb0kSzf4/LY3hKVui9Uoj4daubUOwan+fP/7AxLlBSKueXBlkbtZUiKUuFIXehHJKg7
         /ofcOQv8yRlx6O0uJDH8QHpREtEyuAb32Czc1Fkpq8nPPanGuvD/AXryPMhuLrUYg9nN
         qZuKhNTyAwkScMZUx3BFterjUsIeQZloTDX93Hi4tNNH3BGbWl40ET2QP8+N9ABCINMh
         xDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        fh=erm6rFgFsc+w1y+ByzkEujQ254YLixfh1retodRsxFY=;
        b=BSBjMOGsBYAWdKchlNqP0wQcADUhpBxJDL2cc15y/VE+8CYVaqwPZYYGcgJugylCK0
         R+lTar03wvgaFZfN9qkATB55SbMDamRP7d5ccuJNyalQyMjyK0irmupIDeqeOYiivLHs
         8YLWBKu07h6awjdI80XQqrAugojVfWt9u8JZPT0+ne8yI3CfOu6AQVWwYDzz667Zmsen
         6j949d/fAXUsRb6VM1pbFF7gg0GC95YXKLsDk2gig3aFC0TAtukMcmitsPzGtd9L44yn
         rzt1HnE+gE9SUs95iB33fB+VTOa7Gh+sIxZBQcMNcOA2aSJ/IYbGufcj+gKEfn1o6S7c
         GWUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725116; x=1795329916; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=DU+Afu0ZgNA9yXhZ8KR4EngJKn0WxkkXbUhsa0hi50w1I2Nlbm6ZrKS/IcVN7ak5g0
         OTEmjv/GK9rwiaDcwlKuK5j5DticBoUjjbnJXaCQLmRb/Y99GX5PdGTNqwKxsXkj4CK3
         AgWTmjohjo5DX0+nj3hl0rmiPXkHlxBy+nBzggrLGqenbSlt8ycKYHz3cwycBIlAqjBi
         c+V7g9Q3mctPU9lcfl/T8mPOgL1+Z3wCkj0ach4FnurmMFNMYJaddL51x3YWfsYs73li
         PfE4eOo/ef0ivZ16/2tFQJfBSJ7+kWxxcAtmMWdKCcCT/IG5jwrEug+0yv+japjPexvM
         QATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725116; x=1795329916;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ae1bG6w+qmEf9x2v/m2p04gxYPsvd0s6dg1OJhqCxXE=;
        b=XZtksDUUsfdSRCJIZ/owDq/FtSdR6kK4GTircbsCL++EjngEqma4L9iiLigR6R7jGE
         qHX3cuO/7Fqo67956xLq8cq7EVwUHMt94cd1eDUjHaaHWj726jzo3xTLxBq1CNd3khqr
         FLA2yiwjFrocWKtjyM6of2b5W165hIPFjTyFU+zVWd6yKmMCEXgrn3jZzUx8jbIuZcos
         yIfIEruq6wjFLusbfoelGcWUPtFbULpoNAJ0N9Ha8RfmEANdx2d5WZGxAHALVs/mR5Y+
         BEQgV1oCRb7yQV3SPZNYlf0yg8tsxmREOas88uYCPCZsoO6s0JtJuHKTyx9yY/kfmg5n
         qKsw==
X-Forwarded-Encrypted: i=1; AL+hErGpOF+QSvnYYQSA07dOKaGNQ/83vJDH6RcDmz/n2UExiIIa5YfiVXhnjpH6UV8DGLGigP4Gy1MWBSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p0zifvODQobIWsFP1qF77qUGVQia82PNvY7emOwv7YlW8x5pI
	BFwYdFG7pspICQWnON0xNAhD+59bM1nrxOFu+bcpRkuKKUB0bUCeTg/KPavkMnMbQZZd3F3vdA+
	SJYqY2PBErfprEh1stf3AIX0OolfIZAU=
X-Gm-Gg: AYBFou3fKisPzOK/F0ZK2XtUP2ayHO6JlR5rl0+tL17IcBnyEDCIdQKZHGXz70mbkiR
	Cp/nmCB5XWvLq9V8D/EVB/qUDbOZ4DYY94h2c14Q/V1n3MR8i5TbRF8si2nyOEx4PMBPbVumFCe
	+4yeMlNS3VrNLkvu2pcEysBS7ChtjfqX8gb5v91VeYIu4ynCIeyTYvJx7WQkz1nxEXTP672s4kR
	40yh5LaMtDEmE8gpDwqxsnOyMFHW+4RbxAoPVVfiwL2i3Djn9+Ra8SdrOkgXBVGCCC2fj7WZoiw
	OlYnaBNDqaBp/uGVEkBLNdo42+11Sjv5CTiJQdiRJkUL+i/7xFVK7upxBJq5fXV6QtVToGap4uE
	b/YmKPUOJTO5ZzWJO9Amc5+UJ5NWFUflp3Ic6mwzc7t/tYAOkzSGKZacJyQr2C4sNhoLu
X-Received: by 2002:ac8:5746:0:b0:535:a5fb:644f with SMTP id
 d75a77b69052e-55ac9877608mr106957761cf.73.1794725116540; Sat, 14 Nov 2026
 22:45:16 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:05 +0800
X-Gm-Features: AclHuK-2co-82s-DL-Ir9lk3bEMvqaIe8ZDqkSHlEPOMFzGbM_JIO5KSnIMrJc8
Message-ID: <CAAi4Z-d5eV8FM5sYJj1gqudWyioF++fG8P6uGX_LxbiKSXjekw@mail.gmail.com>
Subject: [PATCH] dmaengine: owl: Check IRQ lookup result
To: vkoul@kernel.org, afaerber@suse.de, mani@kernel.org
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

owl_dma_probe() passes the result of platform_get_irq() to
devm_request_irq() even when the lookup fails. The request can replace
the original error with -EINVAL.

Return the lookup error before requesting the DMA interrupt, so a
deferred probe can be retried.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missing IRQ check in tegra_qspi_probe").

Fixes: 47e20577c24d ("dmaengine: Add Actions Semi Owl family S900 DMA driver")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/dma/owl-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 31a6c6e01a75..daea82718229 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1156,6 +1156,9 @@ static int owl_dma_probe(struct platform_device *pdev)
         * simplification.
         */
        od->irq = platform_get_irq(pdev, 0);
+       if (od->irq < 0)
+               return od->irq;
+
        ret = devm_request_irq(&pdev->dev, od->irq, owl_dma_interrupt, 0,
                               dev_name(&pdev->dev), od);
        if (ret) {
--
2.43.0
