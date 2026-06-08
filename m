Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B83273803
	for <dmaengine@vger.kernel.org>; Mon,  8 Jun 2026 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951945; cv=pass; b=lQvbhrTWdiixZuYB0fxR8hbhvUoyd671V+N7eMN0yKGxa/5lIgEz0UqtqtTKbsb40x0xlZgEbXRlhyGFN3u0FAURZNrZwV9L1M/Ta2vkVOt3B60DnX1NUbV43AzX9WUUm5k9atvHSLGQp0J8kZS2ZXvcc2vDyB5a/n+8oE2gz7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951945; c=relaxed/simple;
	bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAuVMQ+ZvwY6YLhL6n672mLkx0+FliZUVQFgl0qlAQTd+cIqBqRwSvY0YsX7FbKHX5vkXhBRRrQPLB1cx6AIQYJhRmZdVXbQfL0Az5J6q9uLqu4zDUZMnPVigCT8dQfMQQQyCMmrQKFMQfy3y7IhR6uz/VbxDMUxsU8ZeuQVejM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7oo6Kx3; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7oo6Kx3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bef1e6423e7so516682766b.1
        for <dmaengine@vger.kernel.org>; Mon, 08 Jun 2026 13:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780951942; cv=none;
        d=google.com; s=arc-20240605;
        b=g8BvHccjwOPzbklIMXw2OHcbLGcUwl5YrpTgpgTY/z5DCqfwNinmoYH5x3QqgnJUpN
         q1V6hB/mxhwEHytqHz3yHjRgdiXKH7Lki6qrAXm2Ax3OrCEcNYKdp+c4MVL0frd/9sKf
         33R6TZ7WvXyz0S8yZX7LAJlUEe76c9WI752bIcVEEVN8gWbbzpzPgCJwCx6YU0+xbzy8
         V1wfJN9Yrm8g3e2YJqY7YM8ZuKI9n+7YVVF4NhntNBF1gaFMzw4ImizhyjpLbpK9WQta
         t0rBt9b9McEwea9toDeQBpbw3Nytd9QWCfsqp1cg64AJ0j5RQgqUMRsHEYiEB91IuVJ0
         Jo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        fh=kyboV9PeaWnuO+JXcGLIVZmaPJwDhOu+4Vw4/q52wDA=;
        b=SUkNOm9S9EYYzBxY/pQ9Pjv96Egv0striYfOfX1QwqsyMz1JOBwb1q1i/PkqqZhmcb
         pQr5R6og/oj3rHgjbpsVueDJz2YQX8do92kkmZg1fqeeuf+TJ/wKLw/r60evBbxrzNlw
         HagH/av/c8X5olyvcd9GMOuSKrEwPaq16PMvYTLoKfZ8YHy+7b6o+mujeSb71uCW7owj
         xd7sQZ632vP9TKu7QxsQhW8+RBhNdveo39fPFIHFAZAhIpszM8yI4QUP2tdr5FJGwH6+
         yhrQT6cQCUhGQCZAwoc+0/I+vhpmr6dt87waZ9RIjoxCCyLEnYzd1BD+8K2tfNFOIyFj
         hicA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780951942; x=1781556742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        b=b7oo6Kx35AK2fDsqwMsG5GhiC8FXarvgIL8+uCLYMd1qx8zryfoWzDn9CitvF3ARQq
         S949vs5wU98fckjVLd8qiczeXiSbKh4yJB2f8CDwMuH0it8vrmAppCYtGIq88u950FJO
         n6inM5WDrwjaeSPtPMsNT7GXOvIRjDGrLQZ6/fHgp0j8F9dXLZrqcqt6YD0HsJcMFTTM
         GF1OTHudMU4ryBA46UfK/X7tbKPR1URQClaiNg5D1OwjQDijzLePGvQoS/qMlzVAESY7
         DBXvzirBA3nmY6q+L61z6ID9JKJt7HQBDLP/SHuvyvHSKW43h8X7swMbvcRp42d3rcuV
         3Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951942; x=1781556742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W25ew7OtPq3XBskzl76qlbOu0FGmIC+E26EOjAY+RgA=;
        b=aaeQQuzIPwGgwpFc4ezyyVwL9c0P2Svft+wGnaJOH+NLJukIHcZ+6Gi95/APXFlWHt
         aUDTinM6hBdbxPiMTZlSMvIJSNTrm3QY8BVcnF/6xh7ZRJIOTJ7zS3ZkAdJ3MiOcR0fW
         +gZklHrSe1yaWsATOVhnua563NrsuyKrgLShnrIMim/7RFje4TGMZ3IQTYe2eXFQMDJN
         VOXyAWmMKtW5O9EFccT1DkvhrNnryHDDHBiXY5MucIyaj1NcXaa6dguUvTZJ7OEUzG15
         +/zhSCkCL90yZcsUZ00qdXhqBg13BaGiv1OCcFc9WDfzr/8/MZJ+/QbQG1x/Bz9oEQJM
         wJrw==
X-Gm-Message-State: AOJu0Yz4Ou/uJss4tD2Gz7GSa46NzUyPQPyGZopyO4HqO268N7Ysynjr
	9G+aVGtnWT7qzx+8MFxeMusWkmeBr7fVsIAp94nubXi7rvTcyZe/miJCQ5p4dP915KrrAqdbyuE
	MTYhL4XLtcy1roQm+HrjapLqPmoiVkUQ=
X-Gm-Gg: Acq92OES/R5m61tCXVqYax8Fge7ajwjU8tJMWdh+PJoj4sJg2hFM0hfEOiiPxLMH5lb
	E6IT3+zfCFjcIPaeQisAGDW6ndiysWA0gh93hgs1t90L71As2cqfDl/KZpDcV9yMF6Jdzg3SVqq
	5WTU3rB/MxXW7RgJUo3IsccbbA7EcrVFSjO8bcbRzIgUq8b5TssUGqQAnHAEJAyQhOP7LgPoejO
	2xaHtyXcNwNF6+Bs+yu3xWCBnQqGP2ZWdnL00yhYW4hMrDdMBMdxWtzkOARAA44BJ6JbkPl7c0D
	Zt3CWbGy2zwYyQ0CECby1v49BpKTRGNNlZ15N7R3TllJ8AhjliUy3AHydgueATEwGvbvt+LjNlA
	4yVRkoOYeil7UvTJ2dbtnghsYzInFwXlHpAR8eaNyDvZE0Lzw2Wt6jY/Or/4S2xRrmH+R
X-Received: by 2002:a17:907:989:b0:bed:25a6:1c89 with SMTP id
 a640c23a62f3a-bf373407e0amr899008466b.25.1780951941373; Mon, 08 Jun 2026
 13:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608051829.7390-1-rosenp@gmail.com> <aibs9gb5M4-gbCFY@SMW015318>
In-Reply-To: <aibs9gb5M4-gbCFY@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 8 Jun 2026 13:52:09 -0700
X-Gm-Features: AVVi8CfU092ys9IKRz0NL8aHFjs8GUJHMrxAGBkw8vKo0ocK4JDhwLaodGN_EAA
Message-ID: <CAKxU2N9cTuhj4WAu98+6m3qb4Yy5NwZQHcnKUa4ra86+M-S-cg@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: st_fdma: simplify allocation
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/STI ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be|_ptr)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:25=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Sun, Jun 07, 2026 at 10:18:29PM -0700, Rosen Penev wrote:
>
> Nit: dmaengine: st_fdma: simplify allocation by using flexible array
that's in the description. Did it that was to not have it as long,

flexible array member is the proper terminology.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> > Use a flexible array member to combine kzalloc and kcalloc to a single
> > allocation.
> >
> > Add __counted_by for extra runtime analysis. Assign counting variable
> > after allocation before any array accesses.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >
