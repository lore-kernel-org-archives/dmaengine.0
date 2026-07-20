Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EF940B39A
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549070; cv=none; b=BntJf6NCKsTpmmjJn2yOr9mlrrWxjDDjDxr4txi/I5sbFGYMipEsLDWnoHNLPmAqo+jn4Dc8SnUlgKU+dWbrdBfdgnKVJdGUKefOYb+kb136AYZCOZvPNe1UCI5iUMr8sFnJhLYlqYHhmMT1mNfWb1pTpy/q/P1XU98YAszduN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549070; c=relaxed/simple;
	bh=IgOtZk6598P3l2gtZfQn+hzErjCRt72oL/mPASf+8Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XIjGlV3gZ2mYDHCR+MdaV2kVkD/JUBKGsmdYDquoq5EXvVFKrE/S1RGVqh3PcK7PTL0gWIRxgyB5pybICxpaVMluYlztqLF6Xu/BiDiP62B7Qd1EUjhxs0tGb5IJzS/WGKMU69sboAnnoXkR1BnWjGBC42dfl682TjoQFDNysIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gEoeA8YO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gEoeA8YO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so956032f8f.3
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784549063; x=1785153863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXt6KjlGRsEkAG+bRvHxCmyBIQh0OFEmeRxdi42Dq8w=;
        b=gEoeA8YOUrc/PgIaQ6sRHKHeaxC/BmgzWtb25ayVGETBx7wMD0wwjbd2DkUZ8QRFIF
         +scbm2nlSPDBmbQeQjS0iXXT6++u5PxqkV7iuavfHUbXnrx0s+pi6/NjwALuRMER1HA5
         7OUkf0UFoq28fGEOyzcsHsYs6khxIBlVvSbWqO+td/sxdgpeQln9mdtePTEArQBMtTDq
         tfvLp9QbGLhQXfi6T2P9/EMW6M7yZxmg6jB7qoQdOdjvycngnnZqLQ/X8/uLVkzLVSKX
         +ijOJeRICyuO3FEVOM3Pu5Q1XTVeGoYi/CpyHKv2njiIX2ZVJSIy6Be37Ev23z9/lnJ0
         lO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549063; x=1785153863;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXt6KjlGRsEkAG+bRvHxCmyBIQh0OFEmeRxdi42Dq8w=;
        b=PErn0OhoEyqBVd2QSIvn8LMxidBr0iWDV+InlMaxS73nImDRE+0MjSsHkjrLs57Hil
         fTYVELayIW2Ku1Y9eGQMrulgjwcEB9HXVF7HSzUh7ET64fxrxGJAD7oPooTl9AvrY9PT
         qaLEmkV50W3cKWERxO2gPP1C0/KtXYi7MRn6dqgA+aln4/VJ1YIoQRFaSVYPSxKq+/sh
         4N83xd09xq2++QZSPej+Chq/erW/s2EO0gkfwUOvxk2rM7EF5V+L86XaDoWmUlkj1Do9
         YYs3KbaEW5pp9n+OSLO1kSlVJflK6jbVY7IiMDjai2SjHJ4VON1XJQCfEYT7BTcPAeky
         urmQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqaln90IZipQrLJjdAi6eSfePnm0EfET6LevW1Bl/quhvilvAvINC7xeHp7XNHFvLTx26RZZ4aP6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6emyH4HW2P2yyvVJpZDFmVNc1uPqW+Qc5jdx/seo+suxHJU/d
	Y2ZHxp6sTQAjhvlUMpw37V4LBn5xrVWbrNoJ0wbpLEWqgJUFVM7MVQH9ucWEzaviWeS4dUFqlPP
	5DqVb
X-Gm-Gg: AR+sD11oATyOvjySvQSh+GEWVhFIhr4H+EAGhufCMQ0SFPcKmGq9zDq4KtRcFWLYTFk
	BiKCb7QWqvxODHCpWSQt4ZyxZChkQmA10FgMfA2/X7bR3dBs65tPKffl7d3jwm+tu4bWYUus5lI
	IeeHAwyel/kct0yWgfwADiq49eeDnO+9/UYrnVVYZPSm+BSEWj3EVWOAibPr9z4ktA4fTWH2Rmz
	o8piW4+4aj4av+iVcxh2zI7/IHUQ9gTvuv7zakEbr4ljHNWJyC3QgyNixbFjV4DpU24IVcH8WVh
	FAZC1AW8w2Os4hAs1Mb6B5MhzaiIGyebGAQ/U6zWO/H+iceylZ7gIeAbgA4eaSy3+ZnCEDYdve6
	EmAds3b+vZjdyYP6PTjBaEZY6LjodNTaM4LwUaN/ZguM650PnABO4prehRzjoeLlz3S2omBj9S2
	QilUemNX34zcSzvQEiDpLjKDHV9INejBIfGDbxd0NwuvQxfBj/h0o7hhQnmLDAcjDwnc30LSHlT
	UnB
X-Received: by 2002:a05:6000:2208:b0:47f:7736:5485 with SMTP id ffacd0b85a97d-47f7736551dmr5473299f8f.16.1784549063475;
        Mon, 20 Jul 2026 05:04:23 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e499c2sm27668455f8f.4.2026.07.20.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:04:22 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/2] dmaengine: Use named initializers for arrays of pci_device_id
Date: Mon, 20 Jul 2026 14:03:47 +0200
Message-ID: <cover.1784547700.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IgOtZk6598P3l2gtZfQn+hzErjCRt72oL/mPASf+8Kw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXg6oi5kDPUInOiBEjlm58JC2TDD4vPdF8YQch XRq31oKBYuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal4OqAAKCRCPgPtYfRL+ Tvy/B/99uS/Xzxg3Je6lEtoOqAOh6ZQoz3+o/cYkLyi7uywDa8FvKzHsouu0ybrS0qDQ4H6P4SZ Wzw3RncHWhYjvyXPwogf817uuoGG833sYDxw6Zd46a0YnS5GABfpCAAmHZmIEBNfWg8Zj1K1oIx 6bY/gSewaNr6BWdtdF1vIHnG1CIbd3rXYoNZKeUDVUTVoEFmVTkI59+YHOfMxoLT44EeEhwd6oE ye1IaPsGp4vWCM6SPk+CjW6fysatBKQWTZJSjUfAkChYIAqskNxq5R397XWRhWjbq7o1+osD4m0 ZE2UawxGFdIJSYUPCsXWOynSRCf0d5kOdnCbgpb+tp/I26vz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the objective of this patch series is to prepare drivers/dma for a
change of pci_device_id that requires all users to initialize
.driver_data by name. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for more details. (This is about platform_device_id, but I intend to do
that for pci_device_id in the same manner.)

v2 is available at
https://lore.kernel.org/dmaengine/cover.1781161455.git.ukleinek@kernel.org
.

Changes since then:

 - Rebase to current next
 - Add review tags by Frank Li and Andy Shevchenko
 - Fix commit log to talk about the right device_id type (i.e.
   pci_device_id and neither pnp nor platform) (partly found by Sashiko)

Note that Andy prefers the use of PCI_DEVICE_DATA() over PCI_VDEVICE() +
explicit .driver_data because the former is more compact and the
follow-up change to struct pci_device_id could be handled in the
definition of that macro. I disagree here, as the compactness is bought
with quite some magic in the #define once it handles the union, and
being explicit (and thus less compact) has its merits, too. Additionally
the affected drivers need an adaption anyhow in their probe function,
and switching both .probe() and the .id_table in a single patch seems
right to me. Because from my POV my subjective opinion is obviously the
right one, I didn't follow Andy's request.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  dmaengine: hsu: Drop unused pci driver data
  dmaengine: Consistently define pci_device_ids using named initializers

 drivers/dma/amd/ptdma/ptdma-pci.c  |  4 ++--
 drivers/dma/dw-edma/dw-edma-pcie.c |  2 +-
 drivers/dma/dw/pci.c               | 22 +++++++++++-----------
 drivers/dma/hsu/pci.c              |  4 ++--
 drivers/dma/pch_dma.c              | 26 +++++++++++++-------------
 5 files changed, 29 insertions(+), 29 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb

