Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169083;
	b=JIvNE05nm2eCuCoocVT5WbBDB9li27glwtqf/5asekRvZ1DlRjeOQqu6zJJpctKQsyHd
	 jdY2tLcEnBiyXP138m5N3jZ536pUeJzXjx8/sLitu0Njy9F4oTcMFydaHILoe7B2aYZf5
	 Kd1IRC0tbFn5nPGbLwSAqsp7yM3+iCIF7Et5EfGmEbpXOTks0R4egcBg1u5DzGt/JPUBV
	 8tALH0oE7iORDxVUcIQC3hcC07o7gnvmVFN7b7JXN2T5Kwhg+daP1CQ6xUyb1oGtfIwoI
	 e4wprZZRirisWk9NCTgrQX5n4cQmD1UYX8KhLlsmiN2Sd6ybkcY8aKZUcsbS56CRhaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169083;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=wY9MqtvHniAXik0SKF+K8ua8lewyIH/COnExjcDjU4I=;
	b=c0NfTejAVxpOu1d4pDNwOW3IGIu8tjPGBFF9+15dJmwyMigtaHJdSFdYwwqxw0KbNpb/
	 4YhEZc3TbKG3CUNFnUTQGBXaCMDbXALlmhjDDLoEWtJJ2/q1/lvZu/FGNrripdPZlkikG
	 gA/oxKdAPgMOaDIAkmUHdrGMMQ/9EhlS68eASdN0WO0UpiySUJR0f6vNPiFTAhC+qCOmb
	 e7p2WJZdGWQpCvT0FYdvRX9p3egtk1F6LeJKL+qB6fZKqwobRWOuJvp5zAyDGL1hOLPJt
	 Ury3OPekP5jSc2PmUztqqnSnnxsa9T1xZUVIfqPi9HaLopHY7eOFbLICSdKs7njRjJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+S0BHFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0536360A2606;
	Fri, 20 Nov 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+S0BHFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E417B1F000C6;
	Fri, 20 Nov 2026 10:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169082;
	bh=wY9MqtvHniAXik0SKF+K8ua8lewyIH/COnExjcDjU4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=K+S0BHFImVJ0rOje7bfZRxo/qiu0yFaV/vOtojHS/5L3QSvHE2SXJ0zREkdmwy5gC
	 eaVvYFDfd6wn2DW2FWGlbN+Qo15S7AbHp1dgyDUoo8op4dvyTs9fPL9fbNGbnR5Fi8
	 KfCazJh//k2T1Iau60KKoOkFrepHdLuoyOn4FQ8XrCojDAtndlpmQlXEXx1AZZ0Okz
	 rMvFqldwhuJUtBDKhCRvMG1rf4Vo8GE98PmMrCFwaeZRpTwe/8eMJpBV+zaioxPvtp
	 Z+0EiIfxqmvoO/pV9/htsriFbUCF3vg7JdSgnzLwtNDFxvbhk0Bz6rGSsuSTWXUNZI
	 clKve1PgkXZpg==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 SeungUk Nam <tmddnr49449@gmail.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260910074832.15729-1-tmddnr49449@gmail.com>
References: <20260910074832.15729-1-tmddnr49449@gmail.com>
Subject: Re: [PATCH] dmaengine: idxd: Free the minor number when cdev setup
 fails
Message-Id: <179516908056.54365.9147334519544252676.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:34:40 +0530
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
X-Mailer: b4 0.14.3


On Thu, 10 Sep 2026 16:48:32 +0900, SeungUk Nam wrote:
> idxd_wq_add_cdev() allocates a minor number from cdev_ctx->minor_ida for
> the new struct idxd_cdev. When dev_set_name() or cdev_device_add()
> fails, the error path calls put_device(), and the release callback
> idxd_cdev_dev_release() only frees idxd_cdev, so the minor number is
> never returned to the ida. Leaked numbers accumulate across bind/unbind
> cycles, up to MINORMASK, for as long as the module stays loaded.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: idxd: Free the minor number when cdev setup fails
      commit: 56cbd7f69ce6037738410a5c50efb7cacf52b0ae

Best regards,
-- 
~Vinod


