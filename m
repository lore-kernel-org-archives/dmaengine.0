Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580160;
	b=0zFYK8F5LeLUF3lQaMxrpkYoHlt8H9rhsTwADuIDaAJ1Tpo6fO7JBvCUPocr4Mc8oZxl
	 Wjf+gaXbVJI6ky6WbtHyWR98J2K9BgmVjdAwVHC5K+dpHq586uLb+HPgqb9DZ1ELDtwrT
	 E8a9CFY2rNoTK66sqPaD7iReY94nkiTKPgyDnmzOtmPoi2FBIYRhansUpnZ5s+XSpwer0
	 Ee7tfIsLayUQLtZt5RTA2ajrbajdBNC33lTRFWDHRJk25hoj65O7iWnU7zYgxxq9XSN2H
	 dGwKSwkbXbqPN9AH2GzvgBt8mBHu7laKDMUl4PK2vyJ3JMlZ39sjmwstApIx/RGBzPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
	b=UOECPCzSc6fTsvs4WtITcGQmW1cZCCa6c1A2iO8c8llLEBsAE2NjuN7QCxCpGrt1zcnH
	 ZoZF+RbZW0wGgidVhibjXhIpyAMV+aq2xLuDtmWTGA+NnyvAjv9lecBd0G4MZ7/mc7+m7
	 vGt2j3MRFQVuh56ZBl1xuOuZ5SDzU7e4OSSqD02upY0zifgFjBZ+vconFzgFH3jjd10P0
	 wVyoyvibIHCBNr74viZYhGNbsfLbuYcsuKE13IT+7VQixN/JuI+XcqxqXsTQpEcBIU24j
	 hjpYb9SRtguK9VzMLLqUQDpFSH18d1kpH5GAatNsxrRkp676L59eXz6nWnEuQlttoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84792606A323
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84792606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso6821355e9.1
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 06:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580159; x=1795184959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=p5Wfyz1+aOhdni0i8oRYNdeaB/FihhXMOA/hsI0gZ6rbVCzONfqA9Xl9iYkcY1FwWN
         RLBzMAMRG/aZMRBqdCLYCentT0hGBVfCq7AGv2f9dtZOpvi01PBQFt7y4NmqQHXL6poe
         SYD9Mhh1eE/kMR2O0R4HeDtWvCNKNuNjYtwLyHhj4JKqIMumA8Wcv2JILtn25HIUOQtE
         xNBlqCwRGvvUpp3konTq9sYZFr6+sMFW5grY8x13KBYYqq9en3famQyQRQ4/gSmrmF4g
         4C6UUdLpk8rc+wwiXI10YkS1lSVwZvZlVVb/vSCo2ZPvAVD/TBjwc1EBWuaM6IqAePYd
         X9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580159; x=1795184959;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=02CfRShrbmE99Mr/cXOyLvPbPCKKVAoSN1TsgKKl3w+/aK0VMEdyzqzw8SiJDUq7MN
         9D1iCcQIAahuSrRXnpZn3Lj2028wgFzse5YpzGPM2bxupCsnRBT8tv+NMUkXogiVNKXk
         bRsnYEyqlI8uPeE/zgq4XcbiY5uFp7O6GvkLmUczd3iqPrKN0t2jvv8bzGxtSLstmkki
         bEUIgeyKbyR8GgF1AvenyKjtGjV+rZ2trqUEjVNqHoJLnZCc/NtOuw4d/3nHgZBUJaJh
         TPlf6tkG17TTNu1YLgSMHkmLPUuDgWaS0X1InKnG0yLbP2Oc+hMTnDQ6geC9w2GK//jm
         PCFA==
X-Forwarded-Encrypted: i=1; AL+hErFcAr5Y35TDSMNfy/BKr2FQ1A/oM5kbIhqfpOo1RlJwHm5lIdaVhKgueryCHLcJt6T3deDeHvLOML4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O/inc0FpVmVhZwuvUFP96BuqazEbDyDanc1ocGnQjCsaq18OA
	wbFbCQvgUj05lRke8g+1vhb8d2YRY9L0kFlUegICBkXaYzU1t2nyGn8lK+Y3OKfAqTt/l2JWwml
	fVkx+98W76V81aQ==
X-Received: from wmg12.prod.google.com ([2002:a05:600c:22cc:b0:4a1:989a:a866])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5852:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb55a832d4mr36306945e9.14.1794580158523;
 Fri, 13 Nov 2026 06:29:18 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:08 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-1-smostafa@google.com>
Subject: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform [1]
to assign the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

[1] https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20261023101536.3965344-1-smostafa@google.com/
- Rebase on 7.4-rc1
- Collect Bartosz Rb

Changes in v2:
v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.com/
- Collect Frank Rb
- Drop call to pm_runtime_dont_use_autosuspend()

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog

