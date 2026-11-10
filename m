Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279970;
	b=xGLFsCy4kiEcH145LqtHmzDMV5vaY2gT7hdXdMlFNkg0vSoTo4DrTFwTKQ87ZbYDHiFA
	 6Whd8RDziuIXTblgiAyT5qEjSTto9q9NoowTw2SiXKaUavJhqJLheepM8vLwtgRceGmUh
	 6LGnAboy6G9JTl9aP1YqzGU/B+Zcnvpq2MSrHCqCSSHO9So9FhRDJxNnbJU4jvOEj0rBP
	 4aGfQ5py8Mrwc/477aQM+udfGLegxbW6pzebiLmF+rJG3BXwxOBIQ0tWam4wPFuZfzXi+
	 kz4GQ6/nVANpQ8YuWaZK36rODZt8yZwI2HGQKq4v1x0GF1IjzW4B8UG5/Py2HmOw1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
	b=oUv4IRr0nzKpnmZ+UHyBVDMZxbsp+697Q/ggUCGKEEHOGm7zciYuD0p3yfjiE8sNp/Wi
	 CUoDyvEL7feu2b3aQUKKM6o5ZHiCF5aQ5o9A9/UAyL1TlSzY8KAtStKc9v63wcdL7qynG
	 rm4QKddDXvzdD5tJNkpt2ds2XWQe51xkucNJb5OjFunCSArlrJGE/4bqyosiZdzcVxygU
	 5gKcLUCOCgwNf2Exl0a2hSL6hRsv1nltZKMfEWb92U0j9D2K1bTAF50hdEUfqNJ6zn/Qk
	 dNg/bKloxQ6WMWnGL1+I6oxwoQb5OKGoXs7xbTekrR4CFU6qAE/67aoCOox7AtDe3Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2hZugRe;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCDB606A325
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCDB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2hZugRe
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1018376fac.2
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 19:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279969; x=1794884769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
        b=X2hZugRewfOJgt4gy5Y4JYZOmHxUH8N047o0reWVoO/+9T3InzQM1JpUL3dZ8nWIOk
         OjEhESJNnXehBIqTvZvJoxqh3flahsh1fuhpD9/XnH4i7gf0sn7+S2F+BjlozaoZPNsB
         xAMWWePGkg3YIxa8s8Vxd6IsUXIrH7bWaHR6iMQ7t8qcSy26b4tsMj67iDBReK4xeB76
         ZvVs2xWNZq28VkAqaIWUBvYL5d7kK7n4l+FC7LpwuA3bc2c/TcArBw0+wkMIHCipf90P
         FNsjek7M34NRS11/J2Ccx8cV3SARTsbSW28y7CbjzHYwxU+4kWB1Iy4NypY2YnoukTch
         4mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279969; x=1794884769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
        b=e4tBiJmxPJaV+eVtAr4C1NMy4lJe6wiopB7oUf5+kZQEsReGJRwie9rkf5G6ocW9Le
         V91piE5r4q7wUolqVMfED7GErT6R+kFKUxt+SOcfEFJwP9BhHgwDkAHl4POWWRHerv93
         UVA7Y9i670L42uu/Kh6XrFr+WwSwNF+pdliuK8rKNpgYNPz9NIR0jxnAshOKQ05w/vMa
         5Z00RwNQTxCNwxSaI75pvCfM9LFR3N6t/TnglcTGyYi/7c+b4JMZCAf1PP5ggGUwmVe5
         fimKY7aFhXASVMG7rSI2cegDypCccdZFniAVVCLP3NGTk3tGfVWdXjUKFSBdCs9Fh45h
         bK/Q==
X-Gm-Message-State: APuU4Z8wTMvPyshSKCRGpecZALQE1JW8PXmyDloPPAHTltTBmcu8jKAc
	Lm7dmAP05mY6c/GHXUFHfGVsWLCaK6bnScUfq0NLniSyHi8P1GlMU11S
X-Gm-Gg: AYBFou3+2CVeewwNecHnuCf01qkg8roQqQ/yHl0301v4XBxzAEq3hvf3IkP9rVSVw60
	JLhgq1KEkBs8d0yBT9yLW5eplPeDsnNLxXSfaR8ajQ+lNeysRkdZ8hw41QVbKnJ9QsIihVokT84
	ryQ8nsUY9hEyiaXa1lSF99IrwzwzFcw7krymUESN5whp5xGzPy9leQo0VHisDnoJz0cxYQcXoZG
	n5Ddl0eKBKUL4xrIfwJHDIad+QVmCt2phJxtC6XZA0WUlRgRa/Cgx5eB0LOwcrl5ltGfFUXg7jc
	eoLAGYcC76fHgl3oMX8GB/Xg6stjsh6f2JCp4TJJVUEmqbrfUahIVegsPhxve0EL1KciY5aGoqA
	4OoVh+dDEaGpcVumd8/6Yj4gaA5rPK0cxR2uJBb4GEyAZlA86yqtZWbKe2w9SeLLR5RT2nb0fV3
	BWfa1Fws4qL4W382VXFV6eGxtp9YP1yFVJtO8NPiGLIF3oorZS/KTcFihA+0iLKbM4Tr/Sfmr0s
	8lDZcvSixSNuDyo1jgJ8YL7AkmQrs8rpfHf8fuuBvn1LS20KcAqfqQYTtjad7Gw6zMhUQeKRTXD
	HAGidoYzLOaog1Hs34NL9LmLETER9jiHGNK3TjiucEqJplPaKg6+eH0wNtQtvIfU5DGZy1K1/3n
	hu6p1U/x1iZhZqCZ3dNA19y0bD9UB9ewjiTmGhALnMb6fDw/6TFRW09M1tcF4MYGoz5euXQB+1M
	g1MNztY4S32aQ/aeBLKmWwpjQ1ME3moZNRCiBUPBJbOU5+6VOKYrhP
X-Received: by 2002:a05:6871:5826:b0:48f:e107:317e with SMTP id 586e51a60fabf-4ae2271656cmr758240fac.49.1794279969033;
        Mon, 09 Nov 2026 19:06:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Mon, 09 Nov 2026 20:05:59 -0700
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf8X07CpFAtST/2E4lLLAGimkBcQQ/
 t0t/IDJXmYz82ZW4dERenE/rcLhTJ56yyI+n4RptW0QqGIt4ihOpYxy8FPZ0QjVB/RCUHUa/Ng
 PMOjJI8wSjLrVErM0k6kSTBkc1rTsDc/i0Ix4oRkDNjhKzcnSaWva8GIk2oYsXo8cO1riDvfdR
 84ykP7fwxeBSXI0UqFCTB5Np+l9MX0nim3bfkDiaRwCAQAA
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
transfer resources when the channel does not stop. Preserve suspension
status for the pause and resume paths, including acknowledgments that
arrive after a polling timeout or during another channel's interrupt.

Keep a pending pause across cyclic segment completion and resume the
segment only after the client releases the pause. Track the active
descriptor until completion so queued work cannot reissue it while its
interrupt is pending.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use readx_poll_timeout_atomic() for the single-argument status helpers
  and express the termination polling interval and timeout in milliseconds,
  following Andy's review.
- Track pending suspend requests separately from confirmed suspension so
  resume can handle acknowledgments received after a pause timeout.
- Use the atomic polling helper, including its final status check, and
  report -EAGAIN if resume cannot yet cancel a pending suspend request.
- Defer cyclic restart while paused and track the active descriptor until
  completion, preventing resume or issue_pending from reissuing it.
- Reset pause state on successful termination and channel allocation;
  clear stale status when starting a new descriptor.
- Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com

To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Sergey Khimich <serghox@gmail.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 118 ++++++++++++++++++++-----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   2 +
 2 files changed, 96 insertions(+), 24 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

