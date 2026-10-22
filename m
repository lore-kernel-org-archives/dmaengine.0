Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695172;
	b=uCUQrLSjwwbT2nxXVG8w2IEyWzM1T/BmIbZOjCANW6i5CLgyA4BQ5j86Y46RzAT4vKdo
	 ut7z6lRHRKYlo2Lz7vazljqCrWFErqOdNjobCiurQhxi/7kTCW/CWZHgAGjI+IYLuq9IV
	 6FLv2X+UZbp7Q92dBZiadSIwlW1ApWmfL9At/obQi7LR2PkKqLgDdYw0nl6UzWqbCCdrB
	 Z5siJ1tXr022XKvYQeR9sqAGO+Uqmff+zWtYMkv16ImG0QyXrLTK6p/dZdRwEIVNBdWlj
	 XwEnRLCZUYrpsbYpORmANy9HMxGwf5TnCHXJmTx6S29N48T8cLwoMm40Sn5vVO5z+Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GJwkMjAm7gXYWbOMf+KJ0s64Seoh7DobYjpjpDcQVHI=;
	b=lzwBH47mYnCcqSltNJwR++XHrz00FxsMf7HdiIjtk49phVrr0M/8fjep7PVNFxVzCroT
	 vCpWE2etic4d4en74NEiKTGGYU5C5FX/Os1kSlm54ZqH4qPIpOts05/f/9XJtcwGS0E/T
	 JGHqAJdkKlBINxWC3ET1bJ9MUJ47B+eHLJk3EEZvM1dj79m2uCeD+zvlwPGDK7hWa9Zqd
	 cl2AeTGHzc3ByoApPFYW9th22vdDKyMrU27CRoTKDs4Iy9rR/Wr4TP7jlzhoRxtXDiWcX
	 Wn2gQnxoQmxH05I+j1NxRkbPmm7Z5iSjN5wvv2KuuMxM9c4ZTdxw7nAkpvA2N/4ilzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AmQXV4kn;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941D6606A320
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 18:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 941D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AmQXV4kn
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-823e4047037so51902a34.2
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695170; x=1793299970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GJwkMjAm7gXYWbOMf+KJ0s64Seoh7DobYjpjpDcQVHI=;
        b=AmQXV4knyfPNyYdXqT4WYHca76kVg2Svy55CUptNAUo8m7pAo/2SjaThOooPpj4Rlb
         f+FjDfqJOEHaSSwGzzbz0cTwo/pSyPSWQJh0z0Ve6XzlyDFKTcNLw6nWT27ydVjYepNy
         T8lhLsv53fMEkPPqks1CCO8thPzFj16b0DCxfVRAul3jv3D3gLL2EcL3Ti1xoKjWJZVT
         O4HMByzyRQI23tMPhi8MoukibCXAhB4wbj63P4eEaz5IaziIfKheg8ph9SK2KB16EWae
         4vqiQj8/TTkPOpm5gViTpLWsVjrjFjp2je4EWCn6S9FnjaRChNSQ26S21TEho7J3z7IB
         O+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695170; x=1793299970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJwkMjAm7gXYWbOMf+KJ0s64Seoh7DobYjpjpDcQVHI=;
        b=wKtxgFJChqAxGdVpSeHHxV/dKq1n56iUCOSNbnhwzmLsC2RLjKsh77u2imPOtmV5Mj
         EJ7oP1jnMOsPf6wmPVTMmwEGu1mwVU2SYeugr87zDQMTMarWg6Tbr0s0rWP0pKtaIHeV
         cWanZo9S5t5C+gnrBUVDT4YvzeCImmDHYJoQq1XtTRu1bcfDIyieoybSTRl+1zTxkxXZ
         O6yFgh91wNMYDJ+imDU2ifoGhSUEX4O1wPFhb2HQiLJLkaZ3h05JMSdvbFFMbjw3HwQr
         qyY0DDihFTbjsMPbKK69RNubWN9dlAtRu2+NNGwWClSAvN6Iq2lXXuQL7+IWbx+ACS+5
         l49w==
X-Forwarded-Encrypted: i=1; AKwUvBxspw8AFqF+WHLOj1hh7NTr/AedH5AfJDpqKvb4InT/rhU60fUBRneBqh7DkxvtLQLWMJkUOWH2NTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbRA4cm6pTKxJUfQR4J7iKc6JGgcaBauXW+cYaS3lgtmVCxb7b
	LoBEP73Zj2g7liGGrKTUo2/hdyjaIRYhps6BHEUTlSAnoZdtWNcxMvtq
X-Gm-Gg: AYBFou3EsOruu9lk6dFX99QoJB5VIIamXvUzywBXbQCOkVPOtica0xwQIBVIvqfUoQu
	ViPd+Ke4UaqfZo2LtTL87DE66u4Ub+C40Huou+4e5tjbrRPIp3IRCiWV2ReQyiDn/+2sCs1sMGD
	ATqO6bbMdUiNKEelnFkgQdPc5AXql/h2aGsvfhGSYqaV01+GPDhygOTMiRAirS0Dd3b8sgGLtDA
	kAYMZr8+Axo251lpqpLmxqKrNy2DWCEFFll1WLuDIUCCim/PKnB2kV0PMZT+DgBxz+6kctZQ6wp
	otPl/YTaxHAwaAra1Y9kAqSiZfaT1Odk75Lj7LqujAYWlc+g7Z1mvM4/snoeOf+z+/W4/UEWPF7
	4KVU8DSdEC4ORQQA+8BYopCGIhmFVa5h11rr+danVjcbt7jVZQScZFUF22ZoyNPSSEGm6oN2qIF
	/yfqaYdtD8HyK/AKGg3Vgq7k/1foXdb/HJxs8vnAPB7hlyEl6As1FrQpyKYuYfe/3Y/AtZzK+qV
	LeElHikNl62OfpenLB3u0/WpF4gOmFeOLFRg4o8xHdJpvOcGssIicy2eXv7LHNSZTo3vuOUgQ79
	MnoY1kTfaNr9CnpCRU6GmIVmHbtN3Ki8uErlqGW7wIwdeKX/M90Hfiq+WuZwzASg1L0L3rNPpBU
	jEGRDY4ILM3KUXTQX6xiRsliNJLOhHuPa8OeHpmtwGY7y6xZG06zwSZBMspqztlP1jzn+BOv08t
	84ZXkcLDS3LFiakw9b+j2BSBQD
X-Received: by 2002:a05:6830:4429:b0:821:c01c:2ec3 with SMTP id 46e09a7af769-84fa7fa0809mr27863a34.0.1792695170512;
        Thu, 22 Oct 2026 11:52:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] dmaengine: dw: serialize completion and termination
Date: Thu, 22 Oct 2026 12:52:47 -0600
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ7CIBCFr2JYO1qIxZ+V9zBdUBjaMRYM1Gpte
 nehvYDJbL7Je1/exCIGwsgum4kFHCiSdwnEdsN0q1yDQCYxE4WQvBAc4qvuqAfzBtMpiKPTbfC
 OvggDByzLwh6O1nCjWFI8A1r6LPpbtXLq31H32ZkTtYoIdVBJk1/Jia4hh/u1lxItxd6HcVk48
 Gz6c0w6DlLZU6mFkVaer02n6LHTvmPVPM8/sjcp5fwAAAA=
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep descriptor callbacks in the controller tasklet and serialize the
ownership changes used by completion, error recovery and termination.
This lets device_synchronize wait for callbacks while preserving tasklet
scheduling requests from other active channels.

The first two patches carry Serge Semin's fixes [0], with unchanged code
and the collected review trailers. They make tx_status calculate residue
without invoking callbacks [1], clear stopped-channel interrupts and keep
normal completion-list updates under the channel lock [2].

The third patch fixes error recovery separately: recheck the error under
the channel lock, stop the channel and detach the failed descriptor before
starting queued work. The fourth adds synchronization using
tasklet_disable()/tasklet_enable(), preserving pending tasklet runs while
waiting for an executing callback.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://patch.msgid.link/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://patch.msgid.link/20240911184710.4207-3-fancer.lancer@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Carry Serge Semin's two posted fixes before the synchronization change,
  preserving his authorship and revision notes. Add the requested stable
  Cc trailers and Andy Shevchenko's Tested-by tags to those unchanged fixes.
- Add a separate error-recovery fix for stale error status, empty channel
  lists and software-LLP state when terminating or restarting a channel.
- Use tasklet_disable()/tasklet_enable() instead of tasklet_kill() so
  synchronization preserves scheduling requests from other channels.
- Explain descriptor ownership during termination and acknowledge the
  shared-tasklet scheduling race reported by Sashiko.
- Link to v1: https://patch.msgid.link/20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com

Revision history from Serge's series:

Link: https://lore.kernel.org/dmaengine/20240802080756.7415-1-fancer.lancer@gmail.com/
Changelog RFC:
- Add a new patch:
  [PATCH 2/2] dmaengine: dw: Fix XFER bit set, but channel not idle error
  fixing the "XFER bit set, but channel not idle" error.
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.

---
James Hilliard (2):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: synchronize completion callbacks

Serge Semin (2):
      dmaengine: dw: Prevent tx-status calling DMA-desc callback
      dmaengine: dw: Fix XFER bit set, but channel not idle error

 drivers/dma/dw/core.c | 180 +++++++++++++++++++++++++++++---------------------
 1 file changed, 103 insertions(+), 77 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

