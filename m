Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F946EC6E
	for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714167; cv=none; b=QhD6argoB71MFmbIirL8P1vxx69Q3XbqT3/d0gWjiUH78mzWE3zwwZbmMBYQ87Bx5eDMlKnXTBVTcwurzFd0RzFdSO8bRZd7ea8jMG7ClpsBfTVWZ/gI8Bg6fb9ONg2Y6NVwKAzNpfZyvqjb6TMvMa65n2jOFceieTwGUl5baqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714167; c=relaxed/simple;
	bh=cByUVjkJel3B1ybJsMmIYMaJI3DegLh80XKJ7Li8vFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KfvoR9HBIA30AXX1jGp+D6dPfr4UJfxsKlgavIrInHe18JFBHgGFq+u8XEKcjCnJJWFaYuGC7E9kaAyFRbC0/Nf0k3Edo2haRbxl6scuNGeHIljfnAkB/kcDjPZFwLYV+/TWRl+2f0S3Hd/2IPALb+FkZxeRjRS5X1SP9kzfM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io; spf=pass smtp.mailfrom=soundtrack.io; dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b=s1RopHMh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soundtrack.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soundtrack.io header.i=@soundtrack.io header.b="s1RopHMh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698aece3d7eso178573a12.1
        for <dmaengine@vger.kernel.org>; Fri, 14 Aug 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786714164; x=1787318964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=s1RopHMhcGwkv1Tk8Y8wWtF6pKkTpHtZkg4XPDIZ/NKyH6Ok5h1I/6AwgbzwCENjMZ
         b49RTTPagepfTfgVg9lb8cVlmFsAm5gcDTrfr7gPgDxYEw8I558bZcglAfAYXqoyWc2W
         wgBLbz0lw9Jm73z3I+/AVSZ2hglLR9IIdAILNvaund+0Axfwpp3U51I5rLJWW1pRydDq
         1WzNXrcnd4QfVuqrpbTzll8jh8R8NPfcYlX1l1mX2tk1HnnLVCnuYOkEs8NoXgHgFx0u
         WppIYZFn7WAy0odiQLwc70rjiR+s2JIxIiJS5gIA/9vjyRSRsN0g84CjZfXnN2sxvTMq
         vWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714164; x=1787318964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PU9G4zdXRl0NI31/rfDwJrFlwhd8fgXP9fxLHMqe2k8=;
        b=Qg6cp6ewzmg0UVZVhoNu58oddMHyx7S6Z8HjSQF1KQOW9iPfMOOqwOdRKWyEeCmYSt
         C0ahLKMYXf09DLrj2ZopKqOveWAf7TnAzSFNwSFOGsD1g3vmp1hso4efuXSibwFk5MRy
         92NzZN7c6I274iAbCZ8xKVeJFkaU7Kej8b+HelxFKGCmIyVTjhEYD8KkuafxdnokejlJ
         HkUHFZvdJzMFK4cJ25JQnf3md/hIFesiH8tzL9oW7+yxVbAxvP5ZbZfSzJNVt6x9zFkm
         f1tAhHjT1aYqGf9DhATDIM/T+9Sib2mftoulCRPuCkJ4yPzaNHlBu2Cc52NhZwLLPGyj
         pknQ==
X-Forwarded-Encrypted: i=1; AHgh+RowYYNRPv+dhP9I2nIyDsU+5Jp4QaAXDSPswgQ3X7xUMVhDxy+Cb4i8gjLt+4MZ8Pv+psblPsN05HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuD/F2mEG+BscxBBP6f1eYUpndVlHSv7U0n3AeAKD4aqL4OLct
	4loZXLro0xz0e7THGXO6ZpEzmiUd/Zpb9iYncUoxd/b7ZzeiMgL4cXA9I+jKtUqz+TA=
X-Gm-Gg: AR+sD11Lz5/t8zko4gxC3rRLoRS8iiWqMU1Lkg/LekkEjsukQPo1CLOki0+KzzmG6gd
	wGM0yq9wdIsLO1IeNiAsKGevQZExAOnbv0vIUd++32+zsURVu9j+c7zATAKinMkx+UY9Q8HCuHq
	81JrYv3hI26UAq6mPq8n/a06VUZgog2kigzTi5SlKF6DJWYtFzhSfhoPDimNOWBDw+4FimBvaMO
	KmonFBXmLZ5zsLGvLQKYGyDSLm4J6khxElk2kZ7kf9ssbBoFgMPuJNqvu1smKW4FoiOUovbR0XT
	yZ8r6yG13TCmjrAEpNhIHSLKXvl9XKP5ab/jHDl+EuLictTnwpTgAsCHmvlqCypE3G8MLEcXSiB
	6tYXLEaluhnJfyhelv+t+zu7nhHIXcCbAzuaHra/fcv2m5tofhrIq+lgLw0T/xxlKnzeWs4at+l
	S55Tid+7SDdv+/rnbrOxnOGI+f3mn9WoDP6vrR/6Cnmsqk/bGksp/ZTnjhMdPy/TPywTUJSiUYT
	d/RT1BHM7GvVZzlYvmo/uEIHWx7fgxDTLefyB47ZoWhspM6SelGswFAfw==
X-Received: by 2002:a05:6402:3509:b0:6a3:72bc:7bca with SMTP id 4fb4d7f45d1cf-6a38a98619emr1635185a12.3.1786714164235;
        Fri, 14 Aug 2026 06:29:24 -0700 (PDT)
Received: from Christians-MBP (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5eb2sm841941a12.5.2026.08.14.06.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 06:29:23 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>
Subject: [PATCH 0/2] dmaengine: sun6i: Fix two bugs in the DMA status path
Date: Fri, 14 Aug 2026 15:28:28 +0200
Message-ID: <20260814132906.70322-1-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes two bugs in the sun6i DMA driver's tx_status path.

The first patch fixes a non-atomic read of DMA_CHAN_LLI_ADDR and
DMA_CHAN_CUR_CNT in sun6i_get_chan_size(), introduced when cyclic DMA
support was added. The race causes spurious ALSA xruns on Allwinner H3
(Barix IPAM400), confirmed by observation on kernel 6.12.

The second patch fixes a null pointer dereference in sun6i_dma_tx_status()
where to_sun6i_desc() was called unconditionally on the return value of
vchan_find_desc() before the NULL check, present since the driver was
first introduced.

Both patches are candidates for stable backport.

Christian Lugnberg (2):
  dmaengine: sun6i: fix non-atomic read of DMA position registers
  dmaengine: sun6i: fix null pointer dereference in sun6i_dma_tx_status

 drivers/dma/sun6i-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.54.0 (Apple Git-156)

